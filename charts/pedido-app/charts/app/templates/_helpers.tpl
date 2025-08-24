{{- define "pedido-app.name" -}}
{{- default .Chart.Name .Values.global.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pedido-app.fullname" -}}
{{- $name := default .Chart.Name .Values.global.nameOverride -}}
{{- if .Values.global.fullnameOverride -}}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "pedido-app.labels" -}}
app.kubernetes.io/name: {{ include "pedido-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}

{{/* Host del servicio de Postgres (Bitnami) */}}
{{- define "pedido-app.dbHost" -}}
{{- printf "%s-%s" .Release.Name "db" -}}.{{- printf "%s" "postgresql" -}}.svc.cluster.local
{{- end -}}
