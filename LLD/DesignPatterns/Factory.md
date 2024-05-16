
### Factory Pattern

#### Concept
The Factory pattern is a creational design pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created.

#### Usage
- When the exact type of object to be created is determined at runtime.
- When a class cannot anticipate the class of objects it must create.

#### Real-World Analogy
A button factory that can create different types of buttons (e.g., WindowsButton, MacOSButton) based on the operating system.

#### Code Example (Java):
```java
public interface Shape {
    void draw();
}

public class Circle implements Shape {
    public void draw() {
        System.out.println("Drawing Circle");
    }
}

public class Rectangle implements Shape {
    public void draw() {
        System.out.println("Drawing Rectangle");
    }
}

public class ShapeFactory {
    public Shape getShape(String shapeType) {
        if(shapeType == null) {
            return null;
        }
        if(shapeType.equalsIgnoreCase("CIRCLE")) {
            return new Circle();
        } else if(shapeType.equalsIgnoreCase("RECTANGLE")) {
            return new Rectangle();
        }
        return null;
    }
}
```

#### Interview Follow-Up Questions and Answers
1. **What is the difference between Factory and Abstract Factory patterns?**
   - Factory creates objects of a single type, while Abstract Factory creates families of related objects.

2. **What are the benefits of using the Factory pattern?**
   - **Encapsulation:** Hides the instantiation logic.
   - **Flexibility:** Allows for easy addition of new types.

3. **When should you use the Factory pattern?**
   - When a class cannot anticipate the class of objects it needs to create.
