---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: echo-server
spec:
  ingressClassName: nginx
  rules:
  - host: echo-server.zinn.ca
    http:
      paths:
      - backend:
          service:
            name: echo-server
            port:
              number: 8080
        path: /
        pathType: Prefix
