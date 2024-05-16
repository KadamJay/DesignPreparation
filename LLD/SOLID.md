### SOLID Design Principles

SOLID is an acronym for five design principles that make software designs more understandable, flexible, and maintainable. These principles were introduced by Robert C. Martin, also known as Uncle Bob.

### 1. Single Responsibility Principle (SRP)

**Concept:** A class should have only one reason to change, meaning it should have only one job or responsibility.

**Real-World Analogy:** Think of a restaurant. The chef cooks food, the waiter serves it, and the cashier handles payments. Each role has a single responsibility.

**Code Example (Java):**
```java
public class Book {
    private String title;
    private String author;

    // Constructor, getters, setters
}

public class BookPrinter {
    public void printTextToConsole(String text) {
        // Print text to console
        System.out.println(text);
    }

    public void printTextToFile(String text, String fileName) {
        // Write text to a file
    }
}
```
Here, the `Book` class handles book data, and the `BookPrinter` class handles printing, adhering to SRP.

### 2. Open/Closed Principle (OCP)

**Concept:** Software entities (classes, modules, functions, etc.) should be open for extension but closed for modification.

**Real-World Analogy:** Imagine a smartphone where you can install new apps without changing the phone's hardware. The phone is open for extension (new apps) but closed for modification (hardware).

**Code Example (Java):**
```java
public interface Shape {
    double area();
}

public class Rectangle implements Shape {
    private double length;
    private double width;

    public Rectangle(double length, double width) {
        this.length = length;
        this.width = width;
    }

    @Override
    public double area() {
        return length * width;
    }
}

public class Circle implements Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    public double area() {
        return Math.PI * radius * radius;
    }
}

public class AreaCalculator {
    public double calculateArea(Shape shape) {
        return shape.area();
    }
}
```
Here, you can add new shapes without modifying the `AreaCalculator` class.

### 3. Liskov Substitution Principle (LSP)

**Concept:** Subtypes must be substitutable for their base types without altering the correctness of the program.

**Real-World Analogy:** Any car key can start the car it belongs to, regardless of the car model. The car's behavior remains consistent with any valid key.

**Code Example (Java):**
```java
public class Bird {
    public void fly() {
        System.out.println("Flying...");
    }
}

public class Ostrich extends Bird {
    @Override
    public void fly() {
        throw new UnsupportedOperationException("Ostriches can't fly");
    }
}
```
This violates LSP because `Ostrich` cannot be substituted for `Bird`. A correct design would separate flyable birds from non-flyable birds.

### 4. Interface Segregation Principle (ISP)

**Concept:** No client should be forced to depend on methods it does not use. It's better to have many specific interfaces than one general-purpose interface.

**Real-World Analogy:** In a restaurant, a customer ordering food should not be concerned with how the food is cooked or how the inventory is managed.

**Code Example (Java):**
```java
public interface Worker {
    void work();
    void eat();
}

public class OfficeWorker implements Worker {
    @Override
    public void work() {
        // Working
    }

    @Override
    public void eat() {
        // Eating
    }
}

public class RobotWorker implements Worker {
    @Override
    public void work() {
        // Working
    }

    @Override
    public void eat() {
        // Robots don't eat
    }
}
```
This violates ISP. A better design:
```java
public interface Workable {
    void work();
}

public interface Eatable {
    void eat();
}

public class OfficeWorker implements Workable, Eatable {
    @Override
    public void work() {
        // Working
    }

    @Override
    public void eat() {
        // Eating
    }
}

public class RobotWorker implements Workable {
    @Override
    public void work() {
        // Working
    }
}
```

### 5. Dependency Inversion Principle (DIP)

**Concept:** High-level modules should not depend on low-level modules. Both should depend on abstractions (interfaces). Abstractions should not depend on details. Details should depend on abstractions.

**Real-World Analogy:** In a home entertainment system, the remote control (high-level module) does not depend on the specific brand of the TV (low-level module). Both depend on the abstraction of an interface.

**Code Example (Java):**
```java
public class Light {
    public void turnOn() {
        System.out.println("Light is on");
    }
}

public class Switch {
    private Light light;

    public Switch(Light light) {
        this.light = light;
    }

    public void operate() {
        light.turnOn();
    }
}
```
This violates DIP. A better design:
```java
public interface Switchable {
    void turnOn();
}

public class Light implements Switchable {
    @Override
    public void turnOn() {
        System.out.println("Light is on");
    }
}

public class Switch {
    private Switchable device;

    public Switch(Switchable device) {
        this.device = device;
    }

    public void operate() {
        device.turnOn();
    }
}
```

### Summary
Understanding and applying the SOLID principles leads to better software design, ensuring code is more maintainable, flexible, and scalable. Here’s a quick recap:

1. **SRP:** One class, one responsibility.
2. **OCP:** Open for extension, closed for modification.
3. **LSP:** Subtypes should be substitutable for their base types.
4. **ISP:** Prefer small, specific interfaces over a large, general-purpose one.
5. **DIP:** Depend on abstractions, not concrete implementations.