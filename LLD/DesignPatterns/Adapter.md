
### Adapter Pattern

#### Concept
The Adapter pattern is a structural design pattern that allows incompatible interfaces to work together. It acts as a bridge between two incompatible interfaces.

#### Usage
- When you want to use an existing class, and its interface does not match the one you need.
- When you want to create a reusable class that cooperates with unrelated or unforeseen classes.

#### Real-World Analogy
A power adapter that allows a two-prong plug to connect to a three-prong outlet.

#### Code Example (Java):
```java
public interface MediaPlayer {
    void play(String audioType, String fileName);
}

public class AudioPlayer implements MediaPlayer {
    @Override
    public void play(String audioType, String fileName) {
        if(audioType.equalsIgnoreCase("mp3")) {
            System.out.println("Playing mp3 file: " + fileName);
        } else if(audioType.equalsIgnoreCase("vlc") || audioType.equalsIgnoreCase("mp4")) {
            MediaAdapter mediaAdapter = new MediaAdapter(audioType);
            mediaAdapter.play(audioType, fileName);
        } else {
            System.out.println("Invalid media. " + audioType + " format not supported");
        }
    }
}

public class MediaAdapter implements MediaPlayer {
    AdvancedMediaPlayer advancedMediaPlayer;

    public MediaAdapter(String audioType) {
        if(audioType.equalsIgnoreCase("vlc")) {
            advancedMediaPlayer = new VlcPlayer();
        } else if(audioType.equalsIgnoreCase("mp4")) {
            advancedMediaPlayer = new Mp4Player();
        }
    }

    @Override
    public void play(String audioType, String fileName) {
        if(audioType.equalsIgnoreCase("vlc")) {
            advancedMediaPlayer.playVlc(fileName);
        } else if(audioType.equalsIgnoreCase("mp4")) {
            advancedMediaPlayer.playMp4(fileName);
        }
    }
}
```

#### Interview Follow-Up Questions and Answers
1. **What is the difference between Adapter and Facade patterns?**
   - Adapter changes the interface of an existing object, while Facade provides a simplified interface to a complex subsystem.

2. **Can the Adapter pattern be used to wrap multiple classes?**
   - Yes, it can wrap multiple classes to provide a uniform interface.

3. **What are the advantages of the Adapter pattern?**
   - **Interoperability:** Allows incompatible interfaces to work together.
   - **Reusability:** Reuses existing code with different interfaces.
