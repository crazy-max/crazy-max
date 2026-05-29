### Hi there 👋

#### 👷 Check out what I'm currently working on
{{range recentContributions 5}}
- [{{.Repo.Name}}]({{.Repo.URL}}) - {{.Repo.Description}} ({{humanize .OccurredAt}})
{{- end}}

#### 👨‍💻 Repositories I created recently
{{ $recentReposShown := "" -}}
{{/* recentRepos adds 1 internally, so 99 keeps the GitHub GraphQL query at first:100. */ -}}
{{ range recentRepos 99 -}}
{{ if and .Description (lt (len $recentReposShown) 5) }}
- [{{.Name}}]({{.URL}}) - {{.Description}}
{{- $recentReposShown = printf "%s." $recentReposShown -}}
{{ end -}}
{{ end}}

#### 🚀 Latest releases I've contributed to
{{range recentReleases 5}}
- [{{.Name}}]({{.URL}}) ([{{.LastRelease.TagName}}]({{.LastRelease.URL}}), {{humanize .LastRelease.PublishedAt}}){{ with .Description }} - {{.}}{{ end }}
{{- end}}

#### ❤️ Latest sponsors

{{- range sponsors 5 }}
- {{ if (eq .User.Name "") }}_Anonymous_{{ else }}[{{ .User.Name }}]({{ .User.URL }}){{ end }} ({{ humanize .CreatedAt }})
{{- end }}

Thanks again for your support, it is much appreciated! 🙏
