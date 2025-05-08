import time
import json
import os
from datetime import datetime
import sys

# Load settings
def resource_path(relative_path):
    # Works in dev and when bundled with PyInstaller
    try:
        base_path = sys._MEIPASS
    except AttributeError:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)

with open(resource_path("void_settings.json"), "r") as f:

    settings = json.load(f)

def slow_print(text, delay=0.03):
    for char in text:
        print(char, end='', flush=True)
        time.sleep(delay)
    print()

def boot_sequence():
    os.system("cls" if os.name == "nt" else "clear")
    slow_print("VOID ENGINE SYSTEM BOOTING...\n", 0.05)
    time.sleep(0.5)
    for module in settings["boot_modules"]:
        slow_print(f"[OK] {module} initialized.")
        time.sleep(0.2)
    slow_print("\nSystem Ready. Welcome to VOID ENGINE 2.0\n", 0.04)

def main_menu():
    while True:
        print("=== VOID ENGINE MAIN MENU ===")
        print("1. Launch Subsystem")
        print("2. Check Engine Stability")
        print("3. Enter Reality Layer")
        print("4. View Logs")
        print("5. Exit")
        choice = input("> ")

        if choice == "1":
            launch_subsystem()
        elif choice == "2":
            check_stability()
        elif choice == "3":
            enter_reality()
        elif choice == "4":
            view_logs()
        elif choice == "5":
            slow_print("Shutting down VOID ENGINE...")
            break
        else:
            print("Invalid input.")

def launch_subsystem():
    print("\n-- Subsystems Available --")
    for i, s in enumerate(settings["subsystems"], 1):
        print(f"{i}. {s}")
    input("Select a subsystem to launch (fake): ")
    slow_print("Subsystem launching... (this is just a simulation!)\n")
    log_event("Subsystem launched")

def check_stability():
    status = "STABLE" if settings.get("engine_stable", True) else "UNSTABLE"
    print(f"\n[STATUS] Engine Stability: {status}\n")
    log_event("Stability checked")

def enter_reality():
    slow_print("\nEntering Reality Layer...")
    time.sleep(1)
    slow_print("Reality synced. All dimensions aligned.\n")
    log_event("Reality Layer entered")

def view_logs():
    log_path = "VoidLogs/void_log.txt"
    if os.path.exists(log_path):
        print("\n=== VOID ENGINE LOG ===\n")
        with open(log_path, "r") as f:
            print(f.read())
    else:
        print("No logs found.")
    print()

def log_event(message):
    os.makedirs("VoidLogs", exist_ok=True)
    with open("VoidLogs/void_log.txt", "a") as f:
        timestamp = datetime.now().strftime("[%Y-%m-%d %H:%M:%S]")
        f.write(f"{timestamp} {message}\n")

if __name__ == "__main__":
    boot_sequence()
    main_menu()

input("Press Enter to exit...")
