# Description: Doc String for Class Documentation

"""
### Note
* First line should be a short description of the class or function.
* Second line onwards should be attributes details, argument details etc.
"""


class Song:
    """Class to represent a song

    Attributes:
        title (str): The title of the song
        artist (Artist): An artist object representing the songs creator.
        duration (int): The duration of the song in seconds.  May be zero
    """

    def __init__(self, title, artist, duration=0):
        """Song init method

        Args:
            title (str): Initialises the 'title' attribute
            artist (Artist): At Artist object representing the song's creator.
            duration (Optional[int]: Initial value for the 'duration' attribute.
                Will default to zero if not specified.
        """
        self.title = title
        self.artist = artist
        self.duration = duration


if __name__ == '__main__':
    # Print help for the Song class
    help(Song)

    # Print only the doc string for the Song class
    print(Song.__doc__)

    # Get documentation for the __init__ method
    help(Song.__init__)

    # Print only the doc string for the __init__ method
    print(Song.__init__.__doc__)

    # Assign doc string programmatically
    Song.__init__.__doc__ = """NEW DOC STRING for Song init method
    
            Args:
                title (str): Initialises the 'title' attribute
                artist (Artist): At Artist object representing the song's creator.
                duration (Optional[int]: Initial value for the 'duration' attribute.
                    Will default to zero if not specified.
            """
    print(Song.__init__.__doc__)
