---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
metadata:
  name: gateway-api-crds
resources:
{{- if .Values.experimental }}
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_backendlbpolicies.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_backendtlspolicies.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_gatewayclasses.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_gateways.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_grpcroutes.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_httproutes.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_referencegrants.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_tcproutes.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_tlsroutes.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/experimental/gateway.networking.k8s.io_udproutes.yaml
{{- else }}
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/standard/gateway.networking.k8s.io_gatewayclasses.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/standard/gateway.networking.k8s.io_gateways.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/standard/gateway.networking.k8s.io_grpcroutes.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/standard/gateway.networking.k8s.io_httproutes.yaml
- https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/refs/tags/v{{ .Chart.AppVersion }}/config/crd/standard/gateway.networking.k8s.io_referencegrants.yaml
{{- end }}
