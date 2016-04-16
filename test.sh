#/bin/bash

go install github.com/alanctgardner/gogen-avro

# Generate structs for the Avro schema
$GOPATH/bin/gogen-avro test/primitive/primitives.avsc > test/primitive/schema.go
$GOPATH/bin/gogen-avro test/maps/maps.avsc > test/maps/schema.go
$GOPATH/bin/gogen-avro test/arrays/arrays.avsc > test/arrays/schema.go
$GOPATH/bin/gogen-avro test/union/union.avsc > test/union/schema.go
$GOPATH/bin/gogen-avro test/nested/nested.avsc > test/nested/schema.go
$GOPATH/bin/gogen-avro test/enum/enum.avsc > test/enum/schema.go
$GOPATH/bin/gogen-avro test/fixed/fixed.avsc > test/fixed/schema.go

# Run the unit tests to round-trip data with this schema
go test  github.com/alanctgardner/gogen-avro/test/primitive
go test  github.com/alanctgardner/gogen-avro/test/maps
go test  github.com/alanctgardner/gogen-avro/test/arrays
go test  github.com/alanctgardner/gogen-avro/test/union
go test  github.com/alanctgardner/gogen-avro/test/nested
go test  github.com/alanctgardner/gogen-avro/test/enum
go test  github.com/alanctgardner/gogen-avro/test/fixed
