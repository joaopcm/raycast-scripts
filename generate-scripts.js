#!/usr/bin/env node

const fs = require("node:fs");
const path = require("node:path");

// Read the configuration file
const configPath = path.join(__dirname, "services-config.json");
const templatePath = path.join(__dirname, "template.applescript");

if (!fs.existsSync(configPath)) {
	console.error("Error: services-config.json not found");
	process.exit(1);
}

if (!fs.existsSync(templatePath)) {
	console.error("Error: template.applescript not found");
	process.exit(1);
}

// Load configuration and template
const config = JSON.parse(fs.readFileSync(configPath, "utf8"));
const template = fs.readFileSync(templatePath, "utf8");

console.log(`Generating ${config.services.length} AppleScript files...`);

// Generate each service file
config.services.forEach((service) => {
	// Replace placeholders in template
	const scriptContent = template
		.replace(/{{TITLE}}/g, service.title)
		.replace(/{{ICON}}/g, service.icon)
		.replace(/{{DESCRIPTION}}/g, service.description)
		.replace(/{{TARGET_URL}}/g, service.targetUrl)
		.replace(/{{DOMAIN_CHECK}}/g, service.domainCheck);

	// Write the generated file
	const fileName = `open-${service.name}.applescript`;
	const filePath = path.join(__dirname, fileName);

	fs.writeFileSync(filePath, scriptContent);
	console.log(`✅ Generated: ${fileName}`);
});

console.log("\n🎉 All AppleScript files generated successfully!");
console.log("\nTo regenerate all files, run: node generate-scripts.js");
console.log(
	"To add a new service, edit services-config.json and run the generator again.",
);
