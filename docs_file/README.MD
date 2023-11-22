This is our bashbook project.

Project members: 
Peter Fitzgerald
Diarmaid McKeagney

To run the project, first open the project file and right click. You should see the option to "Open in Terminal".

<img src="/docs_file/opening_terminal_cropped.png" alt="Opening the terminal"/>

You should do this twice as you will need to run the client and server script.
In the first terminal you will need to type:

```bash ./client.sh [USERNAME]```

The username provided will be used to name the pipe for this user.
In the other terminal you will need to type:

```bash ./server.sh```

The server script take no arguments.

Now in the client terminal you can type in your requests like create, post, display or add. Make sure you use the correct number of arguments. You can have as many client scripts running at the same time as you want, however you should only run one server script.

To terminate the program, press ctrl+c in both terminals.