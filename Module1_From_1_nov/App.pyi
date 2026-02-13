import tkinter as tk
import ttkbootstrap as ttk

def convert():
    mile_input = entry_int.get()
    km_output = mile_input * 1.6
    output_string.set(km_output)

window = ttk.Window(themename="superhero")
window.title("Miles to Kilometers")
window.geometry("1000x800")

title_label = ttk.Label(
    window, 
    text="Miles to Kilometers", 
    font="Calibri 24 bold"
)
title_label.pack()

input_frame = ttk.Frame(master=window)
entry_int = tk.IntVar()
entry = ttk.Entry(
    master=input_frame,
    textvariable=entry_int
)

button = ttk.Button(
    master=input_frame,
    text="Convert",
    command=convert,
    bootstyle='success'
)
entry.pack(side="left", padx=20)
button.pack(side="left")
input_frame.pack(pady=100)

output_string = tk.StringVar()
output_label = ttk.Label(
    master=window, 
    text="Output",
    font="Didot 24",
    textvariable=output_string, 
)
output_label.pack(pady=5)

window.mainloop()