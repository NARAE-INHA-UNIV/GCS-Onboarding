# 4. Signal-Slot - Python과 QML 간 통신

Signal-Slot 메커니즘을 통한 Python-QML 통신 방법을 학습하는 예제입니다.

## 📚 학습 목표

- Slot의 개념과 직접 호출 방법 이해하기
- Signal을 통한 비동기 통신 패턴 배우기
- 입출력이 있는 Slot 작성 방법 익히기
- Connections를 사용한 Signal 수신 방법 배우기

qml은 전부 상세히 읽어보실 필요 없고 통신 부분 위주로 봐주시면 됩니다.

## 🚀 실행 방법

```bash
cd 4-signal-slot
python main.py
```

## 📖 Signal-Slot 개념

### Signal과 Slot이란?

Qt의 핵심 개념으로, 객체 간 통신을 위한 메커니즘입니다.

- **Slot**: 호출 가능한 함수 (Python 메서드)
- **Signal**: 이벤트를 알리는 방송 (Python에서 발생)

```
QML → Python Slot 호출 → 즉시 결과 반환
Python → Signal 발생 → QML에서 수신 → 반응
```

## 🎯 예제별 설명

### 1. Slot 바로 호출 - 입력 없음, 출력 있음

가장 기본적인 형태로, QML에서 Python 함수를 직접 호출하고 결과를 받습니다.

**Python 코드:**

```python
@Slot(result=str)
def getSimpleMessage(self):
    return "안녕하세요!"
```

**QML 코드:**

```qml
Button {
    onClicked: {
        var result = processor.getSimpleMessage()
        resultLabel.text = result
    }
}
```

**특징:**

- 동기적 호출 (즉시 결과 반환)
- 간단한 조회/계산에 적합

### 2. Slot 바로 호출 - 입력 있음, 출력 있음

파라미터를 전달하고 처리된 결과를 받습니다.

**Python 코드:**

```python
@Slot(str, result=str)
def processText(self, text):
    result = f"처리됨: '{text}'"
    return result
```

**QML 코드:**

```qml
Button {
    onClicked: {
        var result = processor.processText(textInput.text)
        resultLabel.text = result
    }
}
```

**특징:**

- 입력 파라미터 타입 명시 필요
- 여러 파라미터 가능: `@Slot(int, int, result=int)`

### 3. 여러 입력이 있는 Slot

복수의 파라미터를 전달하는 예제입니다.

**Python 코드:**

```python
@Slot(int, int, result=int)
def calculate(self, a, b):
    return a + b
```

**QML 코드:**

```qml
var result = processor.calculate(10, 20)  // 30
```

### 4. Signal을 이용한 비동기 패턴

Slot 호출 후 Signal로 결과를 전달받는 패턴입니다.

**Python 코드:**

```python
# Signal 정의
dataProcessed = Signal(str)

@Slot(str)
def processDataAsync(self, data):
    # 1초 대기 후 처리
    time.sleep(1)

    # 처리 완료 시그널 발생
    result = f"처리 완료: {data.upper()}"
    self.dataProcessed.emit(result)
```

**QML 코드:**

```qml
// Signal 수신 설정
// Connections는 코드 상단에 쓰는 것이 권장되는 패턴임
Connections {
    target: processor

    function onDataProcessed(result) {
        asyncResultLabel.text = result
        asyncResultLabel.color = "#4CAF50"
    }
}

// Slot 호출
Button {
    text: "비동기 처리"

    onClicked: {
        asyncResultLabel.text = "처리 중..."
        asyncResultLabel.color = "#FF9800"
        processor.processDataAsync(asyncInput.text)
    }
}
```

**특징:**

- 비동기 처리에 적합
- 긴 작업을 처리하는 동안 UI는 "처리 중..." 상태 표시
- 완료 후 Signal로 결과 전달

## 🔍 주요 데코레이터와 타입

### @Slot 데코레이터

```python
@Slot()                     # 입력 없음, 출력 없음
@Slot(result=str)           # 입력 없음, 문자열 반환
@Slot(str)                  # 문자열 입력, 출력 없음
@Slot(str, result=str)      # 문자열 입력, 문자열 반환
@Slot(int, int, result=int) # 정수 2개 입력, 정수 반환
```

### 지원되는 타입

| Python 타입 | QML 타입       |
| ----------- | -------------- |
| `str`       | `string`       |
| `int`       | `int`          |
| `float`     | `double`       |
| `bool`      | `bool`         |
| `list`      | `var` (array)  |
| `dict`      | `var` (object) |

### Signal 정의

```python
# 파라미터 없는 Signal
buttonClicked = Signal()

# 문자열 전달하는 Signal
dataProcessed = Signal(str)

# 여러 파라미터
positionChanged = Signal(float, float)
```

## 📊 패턴 비교

### 동기 패턴 (Slot 직접 호출)

```
QML → Slot 호출 → 즉시 결과 반환 → QML에서 사용
```

**장점:**

- 간단하고 직관적
- 즉시 결과 확인 가능

**단점:**

- 긴 작업 시 UI 블로킹

**적합한 사례:**

- 간단한 계산
- 데이터 조회
- 유효성 검사

### 비동기 패턴 (Signal 사용)

```
QML → Slot 호출 → Python 처리 시작 → 완료 후 Signal 트리거 → QML 수신
```

**장점:**

- UI 블로킹 없음
- 여러 Signal로 다양한 상태 전달

**단점:**

- 코드가 복잡
- Connections 설정 필요

**적합한 사례:**

- 파일 처리
- 네트워크 통신
- 드론 텔레메트리 수신
- 긴 계산 작업

## 🚁 GCS 개발 적용 예시

### 텔레메트리 수신

```python
# Python
telemetryUpdated = Signal(float, float, float)  # lat, lon, alt

def on_position_update(self, lat, lon, alt):
    self.telemetryUpdated.emit(lat, lon, alt)
```

```qml
// QML
Connections {
    target: telemetry
    function onTelemetryUpdated(lat, lon, alt) {
        mapView.center = QtPositioning.coordinate(lat, lon)
        altitudeLabel.text = "고도: " + alt.toFixed(1) + "m"
    }
}
```

실제 이런 방식으로 작동하고 있습니다. 시리얼 포트로 들어오는 메시지를 디코딩한 후, 해당 메시지와 연관된 시그널을 트리거해서 UI를 업데이트하도록 하고 있습니다.

## ⚠️ 주의사항

### 타입 불일치

```python
# ❌ 잘못된 예
@Slot(str, result=int)
def process(self, text):
    return "not an int"  # 타입 불일치!

# ✅ 올바른 예
@Slot(str, result=int)
def process(self, text):
    return len(text)  # int 반환
```

### Signal 이름 규칙

```qml
// Python: dataProcessed = Signal(str)
// QML에서 수신할 때는 "on" + 대문자 시작
function onDataProcessed(result) { }  // ✅ 올바름
function onDataprocessed(result) { }  // ❌ 틀림
```

## 💡 참고 자료

- [Qt Signals & Slots](https://doc.qt.io/qt-6/signalsandslots.html)
- [PySide6 Signals and Slots](https://doc.qt.io/qtforpython/overviews/signalsandslots.html)
- [QML Connections](https://doc.qt.io/qt-6/qml-qtqml-connections.html)
