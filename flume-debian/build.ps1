Param(
	[Parameter(Position = 0, ValueFromPipeline = $true)]
	[ValidateNotNullOrEmpty()]
	[System.String]$Version = "1.8.0"
)

docker build ../flume-debian -t bamcis/flume-debian:$Version --build-arg FLUME_VERSION=$Version