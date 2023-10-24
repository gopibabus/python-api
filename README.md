# Python API
Python APIs

### Install Fast API
```bash
pip install "fastapi[all]"  
```

### Start & Stop Server
```bash
#Start
uvicorn main:app

#Stop
kill -SIGINT $(ps aux | grep uvicorn | grep -v grep | awk '{print $2}')
```

### API Documentataion

[api.gopibabu.dev](https://api.gopibabu.dev/)