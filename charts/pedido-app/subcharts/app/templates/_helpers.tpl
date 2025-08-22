{{- define "app.name" -}}app{{- end -}}
{{- define "app.fullname" -}}{{ printf "%s-%s" .Release.Name (include "app.name" .) | trunc 63 | trimSuffix "-" }}{{- end -}}
