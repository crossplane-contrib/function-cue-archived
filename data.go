package main

import (
	"fmt"
	"strings"

	"github.com/crossplane/function-sdk-go/resource"
	"github.com/pkg/errors"
)

// gatherPaths recursively traverses the JSON data and collect jsonpaths in a set
func gatherPaths(data interface{}, path string, paths map[string]struct{}) {
	switch val := data.(type) {
	case map[string]interface{}:
		for key, value := range val {
			newKey := fmt.Sprintf("%s.%v", path, key)
			gatherPaths(value, newKey, paths)
		}
	case []interface{}:
		for i, value := range val {
			newPath := fmt.Sprintf("%s[%d]", path, i)
			gatherPaths(value, newPath, paths)
		}
	default:
		// Reached a leaf node, add the JSON path to the set
		paths[path] = struct{}{}
	}
}

// setData recursively traverses the JSON data and set the data into the DesiredComposed resource
func setData(data interface{}, path string, d *resource.DesiredComposed) error {
	switch val := data.(type) {
	case map[string]interface{}:
		for key, value := range val {
			newKey := fmt.Sprintf("%s.%v", path, key)
			if err := setData(value, newKey, d); err != nil {
				return err
			}
		}
	case []interface{}:
		for i, value := range val {
			newPath := fmt.Sprintf("%s[%d]", path, i)
			if err := setData(value, newPath, d); err != nil {
				return err
			}
		}
	default:
		// Reached a leaf node, add the JSON path to the desired resource
		if path == ".apiVersion" {
			d.Resource.SetAPIVersion(data.(string))
		} else if path == ".kind" {
			d.Resource.SetKind(data.(string))
		} else {
			path = strings.TrimPrefix(path, ".")
			if err := d.Resource.SetValue(path, data); err != nil {
				return errors.Wrapf(err, "setting %s:%s in dxr failed", path, data)
			}
		}
	}

	return nil
}
