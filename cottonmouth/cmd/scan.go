/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"log"
	"os"

	"github.com/spf13/cobra"
)

// scanCmd represents the scan command
var scanCmd = &cobra.Command{
	Use:   "scan",
	Short: "Scan a project for compliance issues",
	Long: `Scan a project for compliance issues.

		This command requires a language and a compliance plugin to be configured.
		It will descend the tree provided and give a score, which is a summary
		of issues discovered.
	`,
	Run: func(cmd *cobra.Command, args []string) {
		valid := false
		for _, o := range opt {
			if o == method {
				valid = true
			}
		}
		if !valid {
			log.Printf("invalid aggregate method %s", method)
			cmd.Help()
			os.Exit(-1)
		}
	},
}

var method string

var opt []string = []string{"sum", "min", "max", "avg", "std", "count"}

func init() {
	rootCmd.AddCommand(scanCmd)

	scanCmd.PersistentFlags().StringVarP(&method, "method", "m", "sum", "aggregation method")

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// scanCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// scanCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
