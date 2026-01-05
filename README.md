# GCS Onboarding

Qt와 PySide6를 사용한 GCS 개발을 위한 온보딩 자료입니다.

## 📋 목차

1. [Simple GUI](#1-simple-qt---pyside6-hello-world) - PySide6 기본
2. [QML GUI](#2-qml-gui---qml을-이용한-선언적-ui) - QML 기본
3. [QML Layout](#3-qml-layout---레이아웃-시스템) - RowLayout & ColumnLayout
4. [Signal-Slot](#4-signal-slot---python과-qml-간-통신) - Python ↔ QML 통신

## 🎯 학습 목표

이 온보딩 과정을 통해 다음을 배울 수 있습니다:

- PySide6를 사용한 Qt 애플리케이션 개발 기초
- QML을 활용한 선언적 UI 작성
- 레이아웃 시스템(RowLayout, ColumnLayout, anchors) 이해
- Signal-Slot 메커니즘을 통한 Python-QML 통신
- 실제 GCS 개발에 필요한 핵심 개념과 패턴

## 🚀 시작하기

### 환경 설정

```bash
# 가상환경 생성 (선택사항)
python -m venv venv
source venv/bin/activate  # macOS/Linux
# 또는
venv\Scripts\activate  # Windows

# 의존성 설치
pip install -r requirements.txt
```

## 💡 공식 문서

- [PySide6 공식 문서](https://doc.qt.io/qtforpython/)
- [QML 기본 문법](https://doc.qt.io/qt-6/qmlfirststeps.html)
- [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [Signals & Slots](https://doc.qt.io/qt-6/signalsandslots.html)
