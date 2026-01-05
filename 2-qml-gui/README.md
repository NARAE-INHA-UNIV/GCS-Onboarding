# 2. PySide6 + QML - QML 입문

QML을 사용한 선언적 UI 개발 방법을 배우는 예제입니다.

## 📚 학습 목표

- QML 기본 문법 이해하기
- Qt Quick Controls 사용하기
- Python과 QML 간의 통신 방법 배우기
- 선언적 UI의 장점 경험하기

## 🚀 실행 방법

```bash
cd 2-qml-gui
python main.py
```

## 📖 코드 설명

### QML이란?

QML(Qt Modeling Language)은 사용자 인터페이스를 선언적으로 작성하는 언어입니다.

- JavaScript 기반 문법
- 동적이고 애니메이션이 풍부한 UI 작성에 최적화
- 디자이너와 개발자 간의 협업에 유리

### 주요 구성요소

#### Python 측 (main.py)

- **QGuiApplication**: QML 기반 애플리케이션을 위한 애플리케이션 객체
- **QQmlApplicationEngine**: QML 파일을 로드하고 실행하는 엔진
- **Backend 클래스**: QML에서 호출할 수 있는 Python 로직
  - `@Slot` 데코레이터로 QML에 노출되는 메서드 정의

#### QML 측 (main.qml)

- **ApplicationWindow**: 최상위 윈도우 컴포넌트
- **ColumnLayout**: 수직 레이아웃 관리
- **Rectangle**: 사각형 도형 (배경, 컨테이너 등으로 활용)
- **Text**: 텍스트 표시
- **Button**: 클릭 가능한 버튼

### Python-QML 통신

```python
# Python에서 객체를 QML에 노출
engine.rootContext().setContextProperty("backend", backend)
```

```qml
// QML에서 Python 메서드 호출
onClicked: {
    statusLabel.text = backend.getGreeting()
}
```

## 🎨 QML vs Widget

| 항목         | Widget (1번)         | QML (2번)                   |
| ------------ | -------------------- | --------------------------- |
| UI 작성 방식 | 절차적 (Python)      | 선언적 (QML)                |
| 코드 위치    | Python 코드에 모두   | Python(로직) + QML(UI) 분리 |
| 애니메이션   | 복잡함               | 쉬움                        |
| 프로토타이핑 | 느림                 | 빠름                        |
| 적합한 용도  | 전통적인 데스크톱 앱 | 모던한 UI, 동적 인터페이스  |

### 언제 사용하나요?

- 모던하고 동적인 UI가 필요할 때
- 애니메이션이 많은 인터페이스
- 디자이너와 개발자가 분업할 때
- GCS 같은 실시간 데이터 시각화

## 🎯 다음 단계

1. 버튼 색상을 변경해보세요
2. 새로운 텍스트 필드를 추가해보세요
3. Python 백엔드에 새로운 기능을 추가하고 QML에서 호출해보세요
4. 애니메이션을 추가해보세요 (예: 버튼 클릭 시 크기 변화)

## 💡 참고 자료

- [QML 기본 문법](https://doc.qt.io/qt-6/qmlfirststeps.html)
- [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [QML과 Python 통합](https://doc.qt.io/qtforpython/tutorials/qmlintegration/qmlintegration.html)

## 🚁 GCS 개발에서의 활용

실제 GCS 개발에서는:

- **QML**: 동적인 맵 디스플레이, 인터랙티브 컨트롤
- **Python**: 드론 통신, 데이터 처리, 비즈니스 로직

두 가지를 조합하여 강력하고 유연한 GCS를 구축할 수 있습니다!
