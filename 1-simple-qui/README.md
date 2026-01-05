# 1. Simple GUI - PySide6 기본

GCS 개발을 위한 첫 번째 온보딩 예제입니다. PySide6의 기본 사용법을 배웁니다.

## 📚 학습 목표

- PySide6 기본 구조 이해하기
- QMainWindow와 기본 위젯 사용하기
- 이벤트 처리 방법 배우기

## 🚀 실행 방법

```bash
cd 1-simple-qui
python main.py
```

## 📖 코드 설명

### QApplication

- Qt 애플리케이션의 핵심 객체
- 모든 Qt 프로그램은 반드시 하나의 QApplication 인스턴스가 필요
- 이벤트 루프를 관리

### QMainWindow

- 메인 윈도우의 기본 클래스
- 메뉴바, 툴바, 상태바 등을 포함할 수 있는 표준 윈도우 구조 제공

### 주요 위젯

- **QLabel**: 텍스트나 이미지를 표시하는 위젯
- **QPushButton**: 클릭 가능한 버튼 위젯
- **QVBoxLayout**: 위젯들을 수직으로 배치하는 레이아웃

### 이벤트 처리

- `clicked.connect()`: 시그널-슬롯 메커니즘으로 이벤트 연결
- Qt의 핵심 개념 중 하나

## 🎯 다음 단계

1. 윈도우 크기를 변경해보세요
2. 라벨의 텍스트를 변경해보세요
3. 새로운 버튼을 추가해보세요
4. 버튼 클릭 시 라벨이 다른 텍스트로 변경되도록 수정해보세요

## 💡 참고 자료

- [PySide6 공식 문서](https://doc.qt.io/qtforpython/)
- [Qt for Python 튜토리얼](https://doc.qt.io/qtforpython/tutorials/index.html)
