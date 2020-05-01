# Dice Container

A Docker container which comes with the Dice interpreter found here: https://github.com/SHoltzen/dice.

## To Build:
```
git@github.com:eczy/dice-container.git
cd dice-container
docker build -t dice .
```

## To Run
```
docker run -it -v absolute_path_to_your_code:/workspace dice
```