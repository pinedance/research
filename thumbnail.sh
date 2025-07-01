#!/bin/bash

# Input and output directories
RESOURCES_DIR="./resources"
THUMBNAIL_DIR="./public/thumbnails"

# Create the thumbnails directory if it doesn't exist (already confirmed by user)
mkdir -p "$THUMBNAIL_DIR"

# Loop through all PDF files in the resources directory
for PDF_FILE in "${RESOURCES_DIR}"/*.pdf; do
  # Extract filename without extension
  FILENAME=$(basename -- "$PDF_FILE")
  FILENAME_NO_EXT="${FILENAME%.*}"

  # Output PNG file path
  OUTPUT_PNG="${THUMBNAIL_DIR}/${FILENAME_NO_EXT}.png"

  # Check if thumbnail already exists
  if [ -f "$OUTPUT_PNG" ]; then
    echo "Thumbnail for $FILENAME already exists. Skipping."
  else
    echo "Creating thumbnail for $FILENAME..."
    # Use ImageMagick to convert the first page of PDF to a 400x600 PNG
    # -density 300: Set the rendering density for PDF (higher for better quality)
    # -quality 90: Set the output image quality
    # -resize 400x600: Resize to 400x600, maintaining aspect ratio and fitting within bounds
    # "$PDF_FILE[0]": Specify the first page of the PDF
    convert -density 300 "$PDF_FILE[0]" -background white -alpha remove -quality 90 -resize 400x600 "$OUTPUT_PNG"
    if [ $? -eq 0 ]; then
      echo "Successfully created $OUTPUT_PNG"
    else
      echo "Error creating thumbnail for $FILENAME"
    fi
  fi
done