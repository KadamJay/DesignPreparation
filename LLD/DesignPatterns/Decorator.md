
### Decorator Pattern

#### Concept
The Decorator pattern is a structural design pattern that allows behavior to be added to an individual object, dynamically, without affecting the behavior of other objects from the same class.

#### Usage
- When you want to add responsibilities to individual objects, not to an entire class.
- When you want to add responsibilities dynamically and transparently, without affecting other objects.

#### Real-World Analogy
Adding features to a car (e.g., sunroof, leather seats) without modifying the car's original class.

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

public abstract class ShapeDecorator implements Shape {
    protected Shape decoratedShape;

    public ShapeDecorator(Shape decoratedShape) {
        this.decoratedShape = decoratedShape;
    }

    public void draw() {
        decoratedShape.draw();
    }
}

public class RedShapeDecorator extends ShapeDecorator {
    public RedShapeDecorator(Shape decoratedShape) {
        super(decoratedShape);
    }

    @Override
    public void draw() {
        decoratedShape.draw();
        setRedBorder(decoratedShape);
    }

    private void setRedBorder(Shape decoratedShape) {
        System.out.println("Border Color: Red");
    }
}
```

#### Interview Follow-Up Questions and Answers
1. **What

 is the difference between Decorator and Proxy patterns?**
   - Decorator adds behavior to objects, while Proxy controls access to objects.

2. **What are the benefits of using the Decorator pattern?**
   - **Flexibility:** Adds behavior without modifying the original class.
   - **Reusability:** Can combine multiple decorators for different behaviors.

3. **When should you use the Decorator pattern?**
   - When you want to add responsibilities to objects dynamically.
