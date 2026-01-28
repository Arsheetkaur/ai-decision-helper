@echo off
echo Starting AI Decision Helper...
echo.

REM Start backend
echo Starting backend on port 8000...
cd backend
call venv\Scripts\activate
start "Backend Server" /B uvicorn app.main:app --reload --port 8000
cd ..

REM Start frontend
echo Starting frontend on port 8080...
cd frontend
start "Frontend Server" /B python -m http.server 8080
cd ..

echo.
echo =========================================
echo ✅ Both servers are running!
echo.
echo 🌐 Frontend: http://localhost:8080
echo ⚙️  Backend:  http://localhost:8000
echo 📚 API Docs: http://localhost:8000/docs
echo.
echo Press any key to stop servers...
echo =========================================
echo.

pause

REM Kill processes
taskkill /F /IM python.exe 2>nul
taskkill /F /IM uvicorn.exe 2>nul
echo Servers stopped.
