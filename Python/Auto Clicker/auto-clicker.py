import os
import sys
import time
import threading
import tkinter as tk
from pynput.mouse import Button, Controller
from pynput.keyboard import Key, Listener
import logging
from pynput import keyboard

# Define the base path of the script
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

class AutoClickerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Auto Clicker")
        self.root.geometry("761x335")  # Set a specific window size for my desired background image.

        # Added logging.
        self.init_logging()

        # Initialize variables.
        self.click_speed = tk.DoubleVar(value=5)
        self.auto_clicking_active = False

        # Try to load and display background image.
        self.background_image = self.load_background_image()
        self.background_label = tk.Label(root, image=self.background_image)
        self.background_label.place(x=0, y=0, relwidth=1, relheight=1)

        # Creating the UI elements.
        self.label = tk.Label(root, text="Auto Clicker")
        self.label.pack()

        self.speed_label = tk.Label(root, text="Clicks per second:")
        self.speed_label.pack()

        self.speed_slider = tk.Scale(root, from_=5, to=999, orient="horizontal", variable=self.click_speed)
        self.speed_slider.pack()

        # The buttons to start and stop auto-clicking process.
        self.start_button = tk.Button(root, text="Start (F1)", command=self.toggle_auto_click)
        self.start_button.pack()

        self.stop_button = tk.Button(root, text="Stop (F2)", command=self.stop_auto_click)
        self.stop_button.pack()

        # Mouse controller and keyboard listener
        self.mouse = Controller()
        self.keyboard_listener = None

    def init_logging(self):
        # Starting the logging for recording events
        self.logger = logging.getLogger("AutoClicker")
        self.logger.setLevel(logging.DEBUG)

        log_format = logging.Formatter("%(asctime)s - %(levelname)s - %(message)s")

        file_handler = logging.FileHandler("autoclicker.log.txt")
        file_handler.setFormatter(log_format)
        self.logger.addHandler(file_handler)

    def load_background_image(self):
        # Hopefully load the background image for the UI
        image_path = os.path.join(BASE_DIR, "images/background_image.png")
        try:
            return tk.PhotoImage(file=image_path)
        except tk.TclError:
            self.logger.error("Background image not found: %s", image_path)
            return None

    def on_press(self, key):
        # Event handler for key press
        if key == Key.f1:
            if not self.auto_clicking_active:
                self.logger.info("Auto Clicker Started")
                self.toggle_auto_click()

    def on_release(self, key):
        # Event handler for key release
        if key == Key.f2:
            self.logger.info("Auto Clicker Stopped")
            self.stop_auto_click()

    def auto_click(self):
        # Auto-clicking logic
        start_time = time.time()
        while self.auto_clicking_active and time.time() - start_time < 30:
            self.mouse.click(Button.left)
            time.sleep(1 / self.click_speed.get())

    def auto_click_thread(self):
        # Start the auto-clicking thread
        auto_click_thread = threading.Thread(target=self.auto_click)
        auto_click_thread.start()
        auto_click_thread.join()
        self.auto_clicking_active = False

    def toggle_auto_click(self):
        # Toggle auto-clicking on/off
        if not self.auto_clicking_active:
            self.auto_clicking_active = True
            self.keyboard_listener = Listener(on_press=self.on_press, on_release=self.on_release)
            self.keyboard_listener.start()
            self.auto_click_thread()
        else:
            self.stop_auto_click()

    def stop_auto_click(self):
        # Stop auto-clicking and cleanup
        self.auto_clicking_active = False
        if self.keyboard_listener:
            self.keyboard_listener.stop()

if __name__ == "__main__":
    root = tk.Tk()
    app = AutoClickerApp(root)
    root.mainloop()
