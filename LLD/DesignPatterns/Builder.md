### Builder Pattern

#### Concept
The Builder pattern is a creational design pattern that provides a way to construct a complex object step by step. It allows you to produce different types and representations of an object using the same construction code.

#### Usage
- When creating complex objects with multiple components.
- When an object needs to be constructed in multiple steps.
- When the construction process must allow different representations.

#### Real-World Analogy
Think of building a house. The process involves many steps (laying the foundation, building walls, installing the roof, etc.). A builder object controls the construction and assembly of the house, allowing different types of houses (e.g., wooden, brick) to be built using the same steps.

#### Code Example (Java):
```java
public class House {
    private String foundation;
    private String structure;
    private String roof;
    private String interior;

    private House(HouseBuilder builder) {
        this.foundation = builder.foundation;
        this.structure = builder.structure;
        this.roof = builder.roof;
        this.interior = builder.interior;
    }

    public static class HouseBuilder {
        private String foundation;
        private String structure;
        private String roof;
        private String interior;

        public HouseBuilder buildFoundation(String foundation) {
            this.foundation = foundation;
            return this;
        }

        public HouseBuilder buildStructure(String structure) {
            this.structure = structure;
            return this;
        }

        public HouseBuilder buildRoof(String roof) {
            this.roof = roof;
            return this;
        }

        public HouseBuilder buildInterior(String interior) {
            this.interior = interior;
            return this;
        }

        public House build() {
            return new House(this);
        }
    }
}
```

#### Interview Follow-Up Questions and Answers
1. **When should you use the Builder pattern?**
   - When an object has multiple optional parameters or when the construction process involves several steps.

2. **What are the advantages of the Builder pattern?**
   - **Clarity:** Separates the construction of a complex object from its representation.
   - **Immutability:** Ensures that the object is immutable after construction.
   - **Reusability:** Reuses the same construction process for different representations.

3. **Can the Builder pattern be used with inheritance?**
   - Yes, but it can be complex. Use the builder pattern with inheritance carefully to avoid tight coupling and complexity.
