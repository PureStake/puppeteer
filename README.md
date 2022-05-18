# GitHub Action to run Puppeteer in Headful mode

### Usage

```yaml
- name: Run tests
  uses: purestake/puppeteer@v1
  env:
    CI: "true"
  with:
    args: npm run test:e2e
```
