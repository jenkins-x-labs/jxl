package tests

import (
	"path/filepath"
	"testing"

	"github.com/jenkins-x/helm-unit-tester/pkg"
)

func TestChartsWithDifferentValues(t *testing.T) {
	chart := "../../charts/jxl-boot"

	_, testcases := pkg.RunTests(t, chart, filepath.Join("test_data"))

	for _, tc := range testcases {
		t.Logf("ran test case %s", tc.Name)
	}
}
