# caprover-action
Action to deploy on Caprover server.


## Inputs

### `server`

**Required** CapRover server's admin panel URL. Ex. https://captain.root.domain.com.

### `token`

**Required** CapRover application token. Use ${{ secrets.CAPROVER_TOKEN }} for better security.

### `appname`

**Required** Application name on the CapRover server. Must exists.

### `branch`

Branch which will be deployed. *Default: master*


## Example usage
```
uses: AlexxNB/caprover-action@v1
with:
  server: 'https://captain.root.domain.com'
  token: '${{ secrets.CAPROVER_TOKEN }}'
  appname: 'my-app'
```
