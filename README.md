# 🎲 Dice Roller App

A simple Flutter app to roll a dice — built as part of a course I'm currently taking to learn Flutter fundamentals.

This app is basically just:  
👉 Press a button → dice rolls with animation → random result shows up 😄

---

## ✨ Features

- Press a button to roll the dice  
- Dice number is randomized between 1–6  
- Fun little animation simulates the rolling effect

---

## 🛠 Tech Stack

- **Flutter** for building the UI  
- **Dart** for the logic and animation  
- **Timer & Random** for simulating the dice roll

---

## 📚 Why I Built This

I built this app as a hands-on exercise from a Flutter course I’m currently learning. It’s a simple project with a single feature — rolling a dice — but it helped me understand:

- How to use `StatefulWidget`  
- How to update UI with `setState`  
- How to animate using `Timer.periodic`  
- How to load images dynamically in Flutter

---

## 🖼 Dice Assets

Dice images (`dice_1.png` to `dice_6.png`) are placed inside the `/assets` folder.  
Make sure to declare them in `pubspec.yaml` like this:

```yaml
flutter:
  images:
    - images/dice1.png
    - images/dice2.png
    - images/dice3.png
    - images/dice4.png
    - images/dice5.png
    - images/dice6.png
```

---

## 🙃 Just for Fun
This app has no real purpose other than to help me learn.
But hey, if you ever need to roll a dice and don’t have a real one... you're covered 🎉
