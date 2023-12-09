# react-point-of-sale

A simple point of sale application built using react &amp; node.js, yarn..

## Steps to Deploy Pos app in Ubuntu VM

1. Fork repo to your account -> https://github.com/mohan-balakrishnan/Testleaf-pos
2. Go to Testleaf-pos/src/api/apiBuilder.js -> modify your server ip
3.Run following commands to deploy app

```bash
sudo apt update
sudo apt install -y curl dirmngr apt-transport-https lsb-release ca-certificates

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs
node -v
sudo npm install -g yarn

git clone https://github.com/mohan-balakrishnan/Testleaf-pos
cd Testleaf-pos

npm install
yarn install
nohup sudo yarn dev:web > /dev/null 2>&1 &

cd api
npm install
yarn install
nohup sudo yarn dev:api > /dev/null 2>&1 &
```

## To run the current code in Development Mode

1. Run `yarn` to install all the dependencies in the root and also in the `api` folder.
2. Run `yarn dev:web` in one terminal session to start the web app in `localhost`
3. Run `yarn dev:api` in another terminal session to start the backend API in `localhost:3500`
4. Navigate to `http://localhost` eg: `http://publicip` and use `admin` as username & password to see the dashboard.

## Some screenshots

<img width="1440" alt="login" src="https://user-images.githubusercontent.com/11159061/41917847-c7aaa21e-7978-11e8-89a3-c24991753fd5.png">

<img width="1438" alt="admin page" src="https://user-images.githubusercontent.com/11159061/41917850-c7ea76a0-7978-11e8-8341-363ecbc421f3.png">

<img width="1440" alt="cart" src="https://user-images.githubusercontent.com/11159061/41918060-2fd37dde-7979-11e8-8a17-02d988f1487e.png">
