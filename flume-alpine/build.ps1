Param(
	[Parameter(Position = 0, ValueFromPipeline = $true)]
	[ValidateNotNullOrEmpty()]
	[System.String]$Version = "1.8.0"
)

docker build ../flume-alpine -t bamcis/flume-alpine:$Version --build-arg FLUME_VERSION=$Version