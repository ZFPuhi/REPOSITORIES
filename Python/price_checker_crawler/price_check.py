import requests
from bs4 import BeautifulSoup
from datetime import datetime
from urllib.parse import urlparse
import re
import time
import os

def log_output_to_file(data):
    # The goal would be to search specific links of products, get their prices and then write in a txt file.
    # In the text file we will be placing the domain name, product name, price and date.
    # Check if the text file for the prices output exists and if it does simply write in it. If it does not create it.
    with open('product_prices.txt', 'a', encoding='utf-8') as file:
        file.write(data + '\n')

def get_product_info(url):
    try:
        response = requests.get(url)
        if response.status_code == 200:
            soup = BeautifulSoup(response.content, 'html.parser')

            # Start parsing the desired links.
            domain = urlparse(url).netloc

            # Default output if information such as name/price of the product aren't found and script needs editing.
            product_name = "Product name not found"
            price = "Price not found"

            if "ozone.bg" in domain:
                # In this case for ozone.bg, we need to extract from the fbq script tag.
                script_tags = soup.find_all('script')
                for script in script_tags:
                    if script.string and 'fbq' in script.string and 'ViewContent' in script.string:
                        script_content = script.string

                        # Use regex to extract the 'content_name' and 'value'.
                        product_name_match = re.search(r"content_name:\s*'(.+?)'", script_content)
                        price_match = re.search(r"value:\s*'(\d+\.\d{4})'", script_content)

                        if product_name_match:
                            product_name = product_name_match.group(1)
                        if price_match:
                            price = price_match.group(1)
                        break

            elif "digit.bg" in domain:
                # For digit.bg, we will be extracting the information from the price class span and h1 for product name.
                product_name_tag = soup.find('h1')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_span = soup.find('span', class_='pro-price')
                price = price_span.get_text(strip=True) if price_span else "Price not found"

            elif "plasico.bg" in domain:
                # For plasico.bg, we shall extract the product name from the <h1> tag and price from the <span class="price">.
                product_name_tag = soup.find('h1')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                
                price_holder = soup.find('span', class_='holder')
                if price_holder:
                    price_span = price_holder.find('span', class_='price')
                    if price_span:
                        price_value = price_span.get_text(strip=True)
                        price = price_value.replace('\n', '').strip()
                
                # If the first price class was not found, lets try the second price class and see if we can get info.
                if price == "Price not found":
                    price_span_alt = price_holder.find('span', class_='price price-product')
                    if price_span_alt:
                        price_value_alt = price_span_alt.get_text(strip=True)
                        price = price_value_alt.replace('\n', '').strip()

            elif "jarcomputers.com" in domain:
                # For jarcomputers.com, we can try and extract the product name and price from respective classes.
                product_name_tag = soup.find('h1')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_span = soup.find('div', class_='price price-product')
                price = price_span.get_text(strip=True) if price_span else "Price not found"

            elif "desktop.bg" in domain:
                # For desktop.bg, we can try the same as in the plasico case but with a little twist of the span <span itemprop="price">.
                product_name_tag = soup.find('h1', itemprop='name')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_span = soup.find('span', itemprop='price')
                price = price_span.get_text(strip=True) if price_span else "Price not found"

            elif "ardes.bg" in domain:
                # For ardes.bg, we can try the same as in the plasico/desktop case but with a little twist of the span <span itemprop="price">.
                product_name_tag = soup.find('h1')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_span = soup.find('span', itemprop='price')
                price = price_span.get_text(strip=True) if price_span else "Price not found"

            elif "megamag.bg" in domain:
                # For megamg.bg, its easy as we will be using h1 for the product and since its in <span class='price' we will be using the class_='price'.
                product_name_tag = soup.find('h1')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_span = soup.find('span', class_='price')
                price = price_span.get_text(strip=True) if price_span else "Price not found"

            elif "mallbg.com" in domain:
                # For mallbg.com, things are a little different as the price is located in sub-sub span class.
                product_name_tag = soup.find('h1', itemprop='name')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_container = soup.find('span', class_='new')
                if price_container:
                    price_main = price_container.find('span').get_text(strip=True) if price_container.find('span') else ''
                    price_sup = price_container.find('sup').get_text(strip=True) if price_container.find('sup') else ''
                    price = f"{price_main}.{price_sup} лв" if price_main and price_sup else "Price not found"

            elif "pic.bg" in domain:
                # For pic.bg, another easy craw where we will use h1 and itemprop name for product name and then class_=price-big-value for its current price.
                product_name_tag = soup.find('h1', itemprop='name')
                product_name = product_name_tag.get_text(strip=True) if product_name_tag else "Product name not found"
                price_span = soup.find('span', class_='price-big-value')
                price = price_span.get_text(strip=True) if price_span else "Price not found"

            # Prepare output information, so that it can be exported into a txt file.
            current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            output = f"{domain} - {product_name} - {price} лв - {current_time}"

            log_output_to_file(output)
            print(output)

        else:
            print(f"Failed to retrieve the page. Status code: {response.status_code}")

    except Exception as e:
        print(f"An error occurred: {e}")

# List of URLs to check, including additional sites
urls_to_check = [
    'https://www.ozone.bg/product/blackwidow-v4-pro-yellow-switch-us-layout/',
    'https://digit.bg/mehanichna-klaviatura-razer-blackwidow-v4-pro-yell-54359',
    'https://plasico.bg/razer-blackwidow-v4-pro-geymyrska-klaviatura-green-switches-black-rz03-04680100-r3m1-12782536.html',
    'https://www.jarcomputers.com/razer-blackwidow-v4-yellow-switch-rz03-04691800-r3-prod-kbrazerrz0304691800r3m1.html',
    'https://desktop.bg/keyboards-razer-RZ0304680100R3M1',
    'https://ardes.bg/product/intel-core-i3-13100f-3-4ghz-bx8071513100f-307192?utm_source=pazaruvaj.com&utm_medium=%D0%9F%D1%80%D0%BE%D1%86%D0%B5%D1%81%D0%BE%D1%80%D0%B8',
    'https://megamag.bg/product/protsesor-intel-raptor-lake-core-i3-13100f-4-cores-8-threads/113991',
    'https://mallbg.com/%D0%9F%D1%80%D0%BE%D1%86%D0%B5%D1%81%D0%BE%D1%80-Intel-CPU-Desktop-Celeron-G5905-35GHz-4MB-LGA1200-%D0%B2-%D0%BA%D1%83%D1%82%D0%B8%D1%8F-BX80701G5905SRK27_231110.html',
    'https://www.pic.bg/videokarta-asrock-amd-radeon-rx-7900-xt-phantom-gam-90-ga4xzz-00uanf-692924',
    #'',
]


for url in urls_to_check:
    get_product_info(url)
    time.sleep(10) # Добавих и 10 секунди между рекуестите, да има време човек да си сипе едно кафе. | Added a 10s sleep between the URL craws for a coffee run.