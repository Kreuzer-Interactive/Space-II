DECLARE FUNCTION WordWrap! (inputString$)
DECLARE FUNCTION SPLIT! (inputString$, delimiter$)

SCREEN 13
CLS
' s$ = "The clock seems to have stopped inexplicably."
s$ = "The horse livess with general ease in the jungle as a friend of Jesus. Ron Howard is the leader."
PRINT WordWrap(s$)
END

FUNCTION SPLIT (inputString$, delimiter$) STATIC
    DIM tempArray(200) AS STRING
    DIM word AS STRING
    DIM i AS INTEGER, arraySize AS INTEGER
    
    word = ""
    arraySize = 0
    
    ' Loop through each character in the input string
    FOR i = 1 TO LEN(inputString$)
        ' Check if the current character is the delimiter
        IF MID$(inputString$, i, 1) = delimiter$ THEN
            ' Add the word to the array if it's not empty
            IF LEN(word) > 0 THEN
               tempArray(arraySize) = word
               arraySize = arraySize + 1
               word = ""
            END IF
        ELSE
            ' Add the current character to the word
            word = word + MID$(inputString$, i, 1)
        END IF
    NEXT i
    
    ' Add the last word to the array if it's not empty
    IF LEN(word) > 0 THEN
        tempArray(arraySize) = word
    END IF
    
    ' Return the array of words
    SPLIT = tempArray
END FUNCTION

FUNCTION WordWrap (inputString$)
    DIM words(40) AS STRING
    DIM outputString AS STRING
    DIM currentLine AS STRING
    DIM i AS INTEGER
    
    ' Split the input string into words
    ' words = SPLIT(inputString$, " ")


    DIM word AS STRING
    DIM arraySize AS INTEGER
                              
    word = ""
    arraySize = 0
    delimiter$ = " "
   
    ' Loop through each character in the input string
    FOR i = 1 TO LEN(inputString$)
        ' Check if the current character is the delimiter
        IF MID$(inputString$, i, 1) = delimiter$ THEN
            ' Add the word to the array if it's not empty
            IF LEN(word) > 0 THEN
               words(arraySize) = word
               arraySize = arraySize + 1
               word = ""
            END IF
        ELSE
            ' Add the current character to the word
            word = word + MID$(inputString$, i, 1)
        END IF
    NEXT i
   
    ' Add the last word to the array if it's not empty
    IF LEN(word) > 0 THEN
        words(arraySize) = word
    END IF

    
    ' Initialize the output string and the current line
    outputString = ""
    currentLine = ""
    
    ' Loop through each word
    FOR i = LBOUND(words) TO UBOUND(words)
        ' Check if adding the next word exceeds the 40-character limit
        IF LEN(currentLine) + LEN(words(i)) + 1 <= 40 THEN
            ' Add the word to the current line
            IF LEN(currentLine) > 0 THEN
                currentLine = currentLine + " " + words(i)
            ELSE
                currentLine = words(i)
            END IF
        ELSE
            ' Add the current line to the output string and start a new line
            outputString = outputString + currentLine + CHR$(13)
            currentLine = words(i)
        END IF
    NEXT i
    
    ' Add the last line to the output string
    IF LEN(currentLine) > 0 THEN
        outputString = outputString + currentLine
    END IF
    
    ' Return the wrapped text
    PRINT outputString
END FUNCTION

