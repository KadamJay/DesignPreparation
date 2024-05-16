
### Observer Pattern

#### Concept
The Observer pattern is a behavioral design pattern that defines a one-to-many dependency between objects so that when one object changes state, all its dependents are notified and updated automatically.

#### Usage
- When an object changes state, and all its dependents need to be notified.
- When a change to one object requires changing others, and you don’t know how many objects need to be changed.

#### Real-World Analogy
A subscription service where users (observers) subscribe to updates from a publisher (subject). When the publisher releases new content, all subscribers are notified.

#### Code Example (Java):
```java
import java.util.ArrayList;
import java.util.List;

public interface Observer {
    void update(String message);
}

public interface Subject {
    void registerObserver(Observer observer);
    void removeObserver(Observer observer);
    void notifyObservers();
}

public class NewsAgency implements Subject {
    private List<Observer> observers = new ArrayList<>();
    private String news;

    public void setNews(String news) {
        this.news = news;
        notifyObservers();
    }

    @Override
    public void registerObserver(Observer observer) {
        observers.add(observer);
    }

    @Override
    public void removeObserver(Observer observer) {
        observers.remove(observer);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(news);
        }
    }
}

public class NewsChannel implements Observer {
    private String news;

    @Override
    public void update(String news) {
        this.news = news;
        System.out.println("NewsChannel received news: " + news);
    }
}
```

#### Interview Follow-Up Questions and Answers
1. **What are the benefits of using the Observer pattern?**
   - **Decoupling:** Subject and observers are loosely coupled.
   - **Flexibility:** Can add/remove observers dynamically.

2. **What is the difference between Observer and Mediator patterns?**
   - Observer defines a one-to-many dependency, while Mediator centralizes complex communications and control logic between related objects.

3. **When should you use the Observer pattern?**
   - When an object needs to notify other objects without knowing who they are.
