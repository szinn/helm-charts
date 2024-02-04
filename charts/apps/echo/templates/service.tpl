---
apiVersion: v1
kind: Service
metadata:
  name: echo-server
spec:
  internalTrafficPolicy: Cluster
  ports:
    - name: http
      port: 8080
      protocol: TCP
      targetPort: 8080
  selector:
    app.kubernetes.io/component: main
    app.kubernetes.io/instance: echo-server
    app.kubernetes.io/name: echo-server
  type: ClusterIP
