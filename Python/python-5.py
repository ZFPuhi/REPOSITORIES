import subprocess

def run_tests(test_command):
    try:
        subprocess.run(test_command, shell=True, check=True)
        print("Tests passed!")
    except subprocess.CalledProcessError:
        print("Tests failed!")

if __name__ == "__main__":
    test_command = "pytest tests/"
    run_tests(test_command)

# script that easily automates the running tests for a web application.