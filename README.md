# Docker_Rusty_Kaspa

## Note: Image atm is a little fat, need to work on trimming it down, but for now it works


1. Cloning the Repository
Clone the repository by running the following command in your terminal:

```git clone https://github.com/2ndtlmining/Docker_Rusty_Kaspa.git```

2. Installing Docker Prerequisites
```sudo apt-get install docker.io```

3. Change your directory to the cloned repository by running:

```cd Docker_Rusty_Kaspa```

4. Building and Running the Docker Image

```docker build -t my-rusty-kaspa .```

5. Run the Docker container based on the built image:

```docker run -d -p 16111:16111 -p 16110:16110 -p 17110:17110 -p 18110:18110 -p 4000:4000 my-rusty-kaspa```

6. Verify that the container is running:

```docker ps```

7. If the container is running copy the container and then you can review the logs:
```docker logs -f <container_name>```

8. You can Exec into the container if you wanted to use the CLI wallet and poke around

```docker exec -it <container-name-or-id> <shell-executable>```
- I like to use bash for the <shell-executable>
