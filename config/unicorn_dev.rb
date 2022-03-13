# typed: false
# worker processes for production environment
worker_processes 4

# Load rails before forking workers for better worker spawn time
preload_app true

# Restart workers hanging more than 30 mins
timeout 1800
