# caprover-action
Action to deploy on Caprover server.


## Inputs

### `server`

**Required** CapRover server's admin panel URL. Ex. https://captain.root.domain.com.

### `token`

**Required** CapRover application token. Use ${{ secrets.CAPROVER_TOKEN }} for better security.

### `appname`

**Required** Application name on the CapRover server. Must exists.

### `image`

Image name which will be deployed.


## Example usage
```
uses: Fabrimat/caprover-action@v2.1
with:
  server: 'https://captain.root.domain.com'
  token: '${{ secrets.CAPROVER_TOKEN }}'
  appname: 'my-app'
  image: nginx:latest
```
