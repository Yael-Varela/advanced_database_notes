-- Search 1: Ask something that IS in the article
Example: "How do vector indexes work?"

What came back? Does it make sense?
What freesql returned were similarity scores of 0.7~0.73. 
This makes sense considering that the article I chose was about Word embedding and not so much about vectors, which would indicate that while it may contain some similar content, it may not be a complete approximation.

-- Search 2: Ask something that is RELATED but not a direct quote
Example: "fast similarity search at scale"
Did it find relevant content even though those exact words aren't in the article?
Yes, because the model associates concepts with the question, that's why the distance is lower to the previous question.

-- Search 3: Ask something UNRELATED
Example: "how to make pasta"

What score did you get? Is it high or low? Why?
I obtained values in the range of 0.85~0.89, indicating a high distance. This makes sense, as it's a completely different topic and concept from the article provided, they are unrelated, hence the high distance.
