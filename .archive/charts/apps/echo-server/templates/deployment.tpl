---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "echo.fullname" . }}
  labels:
    {{- include "echo.labels" . | nindent 4 }}
spec:
  {{- if not .Values.autoscaling.enabled }}
  replicas: {{ .Values.replicaCount }}
  {{- end }}
  selector:
    matchLabels:
      {{- include "echo.selectorLabels" . | nindent 6 }}
  strategy:
    type: Recreate
  template:
    metadata:
      {{- with .Values.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      labels:
        {{- include "echo.labels" . | nindent 8 }}
      	{{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      automountServiceAccountToken: true
      containers:
      - env:
        - name: HTTP_PORT
          value: "8080"
        - name: LOG_IGNORE_PATH
          value: /healthz
        - name: LOG_WITHOUT_NEWLINE
          value: "true"
        image: ghcr.io/mendhak/http-https-echo:31
        imagePullPolicy: IfNotPresent
        livenessProbe:
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          tcpSocket:
            port: 8080
          timeoutSeconds: 1
        name: main
        readinessProbe:
          failureThreshold: 3
          periodSeconds: 10
          successThreshold: 1
          tcpSocket:
            port: 8080
          timeoutSeconds: 1
        resources:
          limits:
            memory: 30M
          requests:
            cpu: 5m
            memory: 30M
        startupProbe:
          failureThreshold: 30
          periodSeconds: 5
          successThreshold: 1
          tcpSocket:
            port: 8080
          timeoutSeconds: 1
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      enableServiceLinks: true
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      serviceAccount: default
      serviceAccountName: default
      terminationGracePeriodSeconds: 30
