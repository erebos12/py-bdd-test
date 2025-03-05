python3 -m venv venv  # Create a virtual environment
source venv/bin/activate  # Activate it


pip3 cache purge
pip3 uninstall -y py-bdd-test
pip3 install --upgrade py-bdd-test

