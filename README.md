# Welcome to Night Writer!

This lil program uses file I/O to translate english messages to simulated braille and back.

To convert english to 'braille':
1. Create a new text file in the night_writer directory (or open test_in.txt)
2. Write your message (all lowercase, no punctuation)
3. Run $ ruby ./lib/night_writer.rb (name of message file).txt (name you want to give output file).txt
4. The program will run and create a new file (that you named) with your translation!

To convert 'braille' to english:
1. Create a new text file in the night_writer directory (or open test_in.txt)
2. Write (or copy) your 'braille' message
3. Run $ ruby ./lib/night_reader.rb (name of message file).txt (name you want to give output file).txt
4. The program will run and create a new file (that you named) with your translation!
