@echo off

set VENV_DIR=venv
set PYTEST_INI=pytest.ini

echo [INFO] Generate pytest.ini
(
    echo [pytest]
    echo pythonpath = src
    echo addopts = -v --tb=short
) > "%PYTEST_INI%"

echo [INFO] Run PyTest
"%VENV_DIR%\Scripts\python.exe" -m pytest tests
set EXIT_CODE=%ERRORLEVEL%

echo [INFO] Cleanup
del "%PYTEST_INI%" 2>nul

exit /b %EXIT_CODE%
