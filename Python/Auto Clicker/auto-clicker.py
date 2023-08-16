import time
import threading
import tkinter as tk
from pynput.mouse import Button, Controller
from pynput.keyboard import Key, Listener

class AutoClickerApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Auto Clicker")

        self.click_speed = tk.DoubleVar(value=5)
        self.running = False

        self.label = tk.Label(root, text="Auto Clicker")
        self.label.pack()

        self.speed_label = tk.Label(root, text="Clicks per second:")
        self.speed_label.pack()

        self.speed_slider = tk.Scale(root, from_=5, to=999, orient="horizontal", variable=self.click_speed)
        self.speed_slider.pack()

        self.start_button = tk.Button(root, text="Start (F1)", command=self.start_auto_click)
        self.start_button.pack()

        self.stop_button = tk.Button(root, text="Stop (F2)", command=self.stop_auto_click)
        self.stop_button.pack()

        self.mouse = Controller()
        self.listener = Listener(on_press=self.on_press, on_release=self.on_release)
        self.auto_click_thread = None

    def on_press(self, key):
        if key == Key.f1:
            print("Auto Clicker Started")
            self.running = True

    def on_release(self, key):
        if key == Key.f2:
            print("Auto Clicker Stopped")
            self.running = False

    def auto_click(self):
        while self.running:
            self.mouse.click(Button.left)
            time.sleep(1 / self.click_speed.get())

    def start_auto_click(self):
        self.running = True
        self.auto_click_thread = threading.Thread(target=self.auto_click)
        self.auto_click_thread.start()

    def stop_auto_click(self):
        self.running = False
        if self.auto_click_thread:
            self.auto_click_thread.join()

if __name__ == "__main__":
    root = tk.Tk()
    app = AutoClickerApp(root)
    root.mainloop()
