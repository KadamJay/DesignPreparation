
### Abstract Factory Pattern

#### Concept
The Abstract Factory pattern is a creational design pattern that provides an interface for creating families of related or dependent objects without specifying their concrete classes.

#### Usage
- When a system needs to be independent of how its objects are created.
- When a system needs to be configured with one of multiple families of objects.

#### Real-World Analogy
A furniture factory that creates different types of furniture (e.g., VictorianChair, ModernChair) based on the style.

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

public interface AbstractFactory {
    Shape getShape(String shapeType);
}

public class ShapeFactory implements AbstractFactory {
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
1. **What are the advantages of using the Abstract Factory pattern?**
   - **Consistency:** Ensures that related objects are created together.
   - **Scalability:** Easy to add new families of products.

2. **What is the difference between Abstract Factory and Builder patterns?**
   - Abstract Factory creates families of related objects, while Builder constructs a complex object step by step.

3. **When should you use the Abstract Factory pattern?**
   - When a system needs to be independent of how its objects are created and needs to work with multiple families of objects.
