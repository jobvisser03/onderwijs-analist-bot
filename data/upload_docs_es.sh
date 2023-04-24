: "${DATA_IMAGE_NAME:=jbrvisser/elasticsearch-oab}"
: "${HAYSTACK_IMAGE_NAME:=deepset/haystack:cpu-main}"
: "${DATASET_DIR:=dataset}"
: "${NETWORK:=network-aob}"

echo "Uploading dataset..."
for filename in ${DATASET_DIR}/*.txt; do
    [ -e "$filename" ] || continue
    echo "Uploading $filename..."
    curl -X POST -H 'Accept: application/json' -F files="@$PWD/$filename" http://127.0.0.1:8000/file-upload > /dev/null
done