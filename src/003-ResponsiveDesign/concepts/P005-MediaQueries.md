# Description: Media Queries

### Media Queries
* Media queries allow the style to depend upon the media properties.
* Examples of media query
```
screen and (max-device-width: 480px) and (resolution: 163dpi)
```
    
### Components of Media Query
1. A media type. Eg. screen, print, all etc.
2. The actual query of a media feature and 'trigger' size. Eg. width, height, orientation, resolution etc.
3. Boolean operators to join multiple conditions and enhance the power of media queries.

### Different Ways to Implement Media Queries
1. Use the @import rule
```
@import url(smallstyle.css) screen and (min-width:600px)
```
2. Put media query directly in the style sheet
```
@media screen and (min-width:500px){..}
```
3. Include query in the link
```
<link rel = “stylesheet” media = “screen and (min-width: 400px)”> and (orientation: portrait)>
```

### Media Query Example
- The file P006-ExampleWithoutMediaQuery.html has 3 column layout by default and does not use media query. 
- The file P007-ExampleWithMediaQuery.html uses media query to set 3 columns only for larger width screen.
