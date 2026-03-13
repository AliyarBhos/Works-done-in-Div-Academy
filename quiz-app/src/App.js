import { useState, useEffect, useRef, useCallback } from "react";

const QUIZ_DATA = [
  {
    id: 1,
    question: "What does CPU stand for?",
    options: ["Central Processing Unit", "Computer Personal Unit", "Central Program Utility", "Core Processing Unit"],
    correct: 0,
    category: "Tech"
  },
  {
    id: 2,
    question: "Which language runs natively in web browsers?",
    options: ["Python", "Java", "JavaScript", "Ruby"],
    correct: 2,
    category: "Dev"
  },
  {
    id: 3,
    question: "What does HTML stand for?",
    options: ["Hyper Transfer Markup Language", "HyperText Markup Language", "High-level Text Management Language", "Hyper Tool Multi Language"],
    correct: 1,
    category: "Dev"
  },
  {
    id: 4,
    question: "Which data structure operates on LIFO (Last In, First Out)?",
    options: ["Queue", "Array", "Stack", "Linked List"],
    correct: 2,
    category: "CS"
  },
  {
    id: 5,
    question: "What is the time complexity of binary search?",
    options: ["O(n)", "O(n²)", "O(log n)", "O(1)"],
    correct: 2,
    category: "CS"
  },
  {
    id: 6,
    question: "Which protocol is used to send emails?",
    options: ["HTTP", "FTP", "SMTP", "SSH"],
    correct: 2,
    category: "Tech"
  },
  {
    id: 7,
    question: "What does CSS stand for?",
    options: ["Creative Style Sheets", "Cascading Style Sheets", "Computer Style Syntax", "Coded Styling System"],
    correct: 1,
    category: "Dev"
  },
  {
    id: 8,
    question: "In React, what hook is used for side effects?",
    options: ["useState", "useCallback", "useMemo", "useEffect"],
    correct: 3,
    category: "Dev"
  }
];

const TIMER_DURATION = 60;

const categoryColors = { Tech: "#00d4ff", Dev: "#ff6b35", CS: "#a855f7" };

const GlowOrb = ({ x, y, color }) => (
  <div style={{
    position: "fixed", left: x, top: y, width: 400, height: 400,
    borderRadius: "50%", background: color, filter: "blur(120px)",
    opacity: 0.12, pointerEvents: "none", transform: "translate(-50%, -50%)",
    transition: "all 2s ease"
  }} />
);

const TimerRing = ({ timeLeft, total }) => {
  const radius = 28;
  const circ = 2 * Math.PI * radius;
  const progress = timeLeft / total;
  const offset = circ * (1 - progress);
  const color = timeLeft > 30 ? "#00d4ff" : timeLeft > 10 ? "#ff9500" : "#ff3b3b";

  return (
    <div style={{ position: "relative", width: 72, height: 72, flexShrink: 0 }}>
      <svg width="72" height="72" style={{ transform: "rotate(-90deg)" }}>
        <circle cx="36" cy="36" r={radius} fill="none" stroke="rgba(255,255,255,0.08)" strokeWidth="4" />
        <circle cx="36" cy="36" r={radius} fill="none" stroke={color}
          strokeWidth="4" strokeLinecap="round"
          strokeDasharray={circ} strokeDashoffset={offset}
          style={{ transition: "stroke-dashoffset 1s linear, stroke 0.3s ease" }} />
      </svg>
      <div style={{
        position: "absolute", inset: 0, display: "flex", alignItems: "center",
        justifyContent: "center", fontFamily: "'Space Mono', monospace",
        fontSize: 14, fontWeight: 700, color
      }}>{timeLeft}</div>
    </div>
  );
};

export default function QuizApp() {
  const [phase, setPhase] = useState("start"); // start | quiz | result
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState(null);
  const [score, setScore] = useState(0);
  const [results, setResults] = useState([]);
  const [timeLeft, setTimeLeft] = useState(TIMER_DURATION);
  const [animating, setAnimating] = useState(false);
  const [cardVisible, setCardVisible] = useState(false);
  const timerRef = useRef(null);

  const q = QUIZ_DATA[current];

  const goNext = useCallback((chosenIdx, wasTimeout = false) => {
    if (selected !== null && !wasTimeout) return;
    clearInterval(timerRef.current);

    const correct = q.correct;
    const isCorrect = chosenIdx === correct;
    let newScore = score;

    if (wasTimeout) {
      newScore = score - 1;
    } else if (isCorrect) {
      newScore = score + 1;
    }

    if (!wasTimeout) setSelected(chosenIdx);

    const result = {
      question: q.question,
      chosen: wasTimeout ? null : chosenIdx,
      correct,
      options: q.options,
      category: q.category,
      timeout: wasTimeout
    };

    setTimeout(() => {
      setScore(newScore);
      setResults(prev => [...prev, result]);

      if (current + 1 >= QUIZ_DATA.length) {
        setAnimating(true);
        setTimeout(() => { setPhase("result"); setAnimating(false); }, 400);
      } else {
        setAnimating(true);
        setTimeout(() => {
          setCurrent(c => c + 1);
          setSelected(null);
          setTimeLeft(TIMER_DURATION);
          setAnimating(false);
          setCardVisible(false);
          setTimeout(() => setCardVisible(true), 50);
        }, 400);
      }
    }, wasTimeout ? 0 : 1200);
  }, [q, score, current, selected]);

  useEffect(() => {
    if (phase !== "quiz" || selected !== null) return;
    clearInterval(timerRef.current);
    timerRef.current = setInterval(() => {
      setTimeLeft(t => {
        if (t <= 1) { clearInterval(timerRef.current); goNext(null, true); return 0; }
        return t - 1;
      });
    }, 1000);
    return () => clearInterval(timerRef.current);
  }, [phase, current, selected, goNext]);

  useEffect(() => {
    if (phase === "quiz") {
      setCardVisible(false);
      setTimeout(() => setCardVisible(true), 80);
    }
  }, [phase]);

  const startQuiz = () => {
    setPhase("quiz"); setCurrent(0); setSelected(null);
    setScore(0); setResults([]); setTimeLeft(TIMER_DURATION);
  };

  const getButtonStyle = (idx) => {
    const base = {
      padding: "14px 20px", borderRadius: 12, border: "1.5px solid",
      cursor: selected !== null ? "default" : "pointer",
      fontSize: 15, fontFamily: "'DM Sans', sans-serif", fontWeight: 500,
      textAlign: "left", transition: "all 0.25s ease", lineHeight: 1.4,
      background: "transparent", color: "#e8eaf0", letterSpacing: "0.01em"
    };
    if (selected === null) return {
      ...base,
      borderColor: "rgba(255,255,255,0.12)",
      ":hover": { background: "rgba(255,255,255,0.06)" }
    };
    if (idx === q.correct) return { ...base, borderColor: "#22c55e", background: "rgba(34,197,94,0.15)", color: "#4ade80" };
    if (idx === selected && idx !== q.correct) return { ...base, borderColor: "#ef4444", background: "rgba(239,68,68,0.15)", color: "#f87171" };
    return { ...base, borderColor: "rgba(255,255,255,0.06)", color: "rgba(255,255,255,0.3)" };
  };

  return (
    <div style={{
      minHeight: "100vh", background: "#080b14",
      fontFamily: "'DM Sans', sans-serif", color: "#e8eaf0",
      display: "flex", alignItems: "center", justifyContent: "center",
      padding: "20px", overflow: "hidden", position: "relative"
    }}>
      <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600&family=Space+Mono:wght@700&family=Syne:wght@700;800&display=swap" rel="stylesheet" />

      <GlowOrb x="15%" y="20%" color="#00d4ff" />
      <GlowOrb x="85%" y="75%" color="#a855f7" />
      <GlowOrb x="60%" y="10%" color="#ff6b35" />

      {/* Dot grid */}
      <div style={{
        position: "fixed", inset: 0, pointerEvents: "none",
        backgroundImage: "radial-gradient(circle, rgba(255,255,255,0.04) 1px, transparent 1px)",
        backgroundSize: "32px 32px"
      }} />

      {/* ── START SCREEN ── */}
      {phase === "start" && (
        <div style={{ maxWidth: 560, width: "100%", textAlign: "center" }}>
          <div style={{
            display: "inline-block", padding: "5px 14px", borderRadius: 999,
            border: "1px solid rgba(0,212,255,0.3)", background: "rgba(0,212,255,0.06)",
            color: "#00d4ff", fontSize: 12, fontFamily: "'Space Mono', monospace",
            letterSpacing: "0.1em", marginBottom: 28
          }}>KNOWLEDGE QUIZ</div>

          <h1 style={{
            fontFamily: "'Syne', sans-serif", fontSize: "clamp(42px, 8vw, 68px)",
            fontWeight: 800, lineHeight: 1.05, margin: "0 0 20px",
            background: "linear-gradient(135deg, #ffffff 0%, rgba(255,255,255,0.5) 100%)",
            WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent"
          }}>Test Your Tech Knowledge</h1>

          <p style={{ color: "rgba(255,255,255,0.45)", fontSize: 17, lineHeight: 1.7, margin: "0 0 48px" }}>
            8 questions across Computer Science, Web Development, and Technology.
            You have <strong style={{ color: "#00d4ff" }}>60 seconds</strong> per question — score drops if time runs out.
          </p>

          <div style={{ display: "flex", justifyContent: "center", gap: 24, marginBottom: 52, flexWrap: "wrap" }}>
            {[["8", "Questions"], ["60s", "Per Question"], ["+1 / −1", "Score Rules"]].map(([val, label]) => (
              <div key={label} style={{
                padding: "18px 28px", borderRadius: 16,
                border: "1px solid rgba(255,255,255,0.08)",
                background: "rgba(255,255,255,0.03)", textAlign: "center"
              }}>
                <div style={{ fontFamily: "'Space Mono', monospace", fontSize: 22, fontWeight: 700, color: "#fff", marginBottom: 4 }}>{val}</div>
                <div style={{ fontSize: 12, color: "rgba(255,255,255,0.35)", letterSpacing: "0.05em" }}>{label}</div>
              </div>
            ))}
          </div>

          <button onClick={startQuiz} style={{
            padding: "18px 56px", borderRadius: 999,
            background: "linear-gradient(135deg, #00d4ff, #0099cc)",
            border: "none", color: "#080b14", fontSize: 17, fontWeight: 700,
            cursor: "pointer", letterSpacing: "0.02em",
            boxShadow: "0 0 40px rgba(0,212,255,0.3), 0 4px 20px rgba(0,0,0,0.4)",
            fontFamily: "'DM Sans', sans-serif",
            transition: "transform 0.2s, box-shadow 0.2s"
          }}
            onMouseEnter={e => { e.target.style.transform = "scale(1.04)"; e.target.style.boxShadow = "0 0 60px rgba(0,212,255,0.45), 0 4px 20px rgba(0,0,0,0.4)"; }}
            onMouseLeave={e => { e.target.style.transform = "scale(1)"; e.target.style.boxShadow = "0 0 40px rgba(0,212,255,0.3), 0 4px 20px rgba(0,0,0,0.4)"; }}
          >Start Quiz →</button>
        </div>
      )}

      {/* ── QUIZ SCREEN ── */}
      {phase === "quiz" && (
        <div style={{
          maxWidth: 640, width: "100%",
          opacity: animating ? 0 : (cardVisible ? 1 : 0),
          transform: animating ? "translateY(20px)" : (cardVisible ? "translateY(0)" : "translateY(20px)"),
          transition: "opacity 0.35s ease, transform 0.35s ease"
        }}>
          {/* Progress bar */}
          <div style={{ marginBottom: 28 }}>
            <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 10 }}>
              <span style={{ fontSize: 13, color: "rgba(255,255,255,0.35)", fontFamily: "'Space Mono', monospace" }}>
                {current + 1} / {QUIZ_DATA.length}
              </span>
              <span style={{ fontSize: 13, color: "rgba(255,255,255,0.35)", fontFamily: "'Space Mono', monospace" }}>
                SCORE: <span style={{ color: score >= 0 ? "#22c55e" : "#ef4444" }}>{score > 0 ? "+" : ""}{score}</span>
              </span>
            </div>
            <div style={{ height: 3, background: "rgba(255,255,255,0.07)", borderRadius: 999, overflow: "hidden" }}>
              <div style={{
                height: "100%", borderRadius: 999,
                background: "linear-gradient(90deg, #00d4ff, #a855f7)",
                width: `${((current + 1) / QUIZ_DATA.length) * 100}%`,
                transition: "width 0.4s ease"
              }} />
            </div>
          </div>

          {/* Card */}
          <div style={{
            background: "rgba(255,255,255,0.03)", borderRadius: 24,
            border: "1px solid rgba(255,255,255,0.09)",
            backdropFilter: "blur(20px)", overflow: "hidden",
            boxShadow: "0 24px 80px rgba(0,0,0,0.5)"
          }}>
            {/* Card header */}
            <div style={{
              padding: "24px 28px 20px",
              borderBottom: "1px solid rgba(255,255,255,0.06)",
              display: "flex", justifyContent: "space-between", alignItems: "center"
            }}>
              <span style={{
                padding: "4px 12px", borderRadius: 999,
                border: `1px solid ${categoryColors[q.category]}44`,
                background: `${categoryColors[q.category]}11`,
                color: categoryColors[q.category],
                fontSize: 11, fontFamily: "'Space Mono', monospace", letterSpacing: "0.1em"
              }}>{q.category}</span>
              <TimerRing timeLeft={timeLeft} total={TIMER_DURATION} />
            </div>

            {/* Question */}
            <div style={{ padding: "28px 28px 24px" }}>
              <h2 style={{
                fontFamily: "'Syne', sans-serif", fontSize: "clamp(18px, 3vw, 22px)",
                fontWeight: 700, lineHeight: 1.4, margin: 0, color: "#fff"
              }}>{q.question}</h2>
            </div>

            {/* Options */}
            <div style={{ padding: "0 28px 28px", display: "flex", flexDirection: "column", gap: 10 }}>
              {q.options.map((opt, idx) => (
                <button key={idx} onClick={() => selected === null && goNext(idx)}
                  style={getButtonStyle(idx)}
                  onMouseEnter={e => { if (selected === null) e.currentTarget.style.background = "rgba(255,255,255,0.06)"; }}
                  onMouseLeave={e => { if (selected === null) e.currentTarget.style.background = "transparent"; }}
                >
                  <span style={{
                    display: "inline-flex", alignItems: "center", justifyContent: "center",
                    width: 26, height: 26, borderRadius: 8,
                    border: "1px solid rgba(255,255,255,0.12)",
                    fontSize: 11, fontFamily: "'Space Mono', monospace",
                    marginRight: 14, flexShrink: 0,
                    background: selected !== null && idx === q.correct ? "rgba(34,197,94,0.2)" :
                      selected === idx && idx !== q.correct ? "rgba(239,68,68,0.2)" : "transparent",
                    color: selected !== null && idx === q.correct ? "#4ade80" :
                      selected === idx && idx !== q.correct ? "#f87171" : "rgba(255,255,255,0.3)",
                    borderColor: selected !== null && idx === q.correct ? "#22c55e44" :
                      selected === idx && idx !== q.correct ? "#ef444444" : "rgba(255,255,255,0.12)"
                  }}>
                    {["A", "B", "C", "D"][idx]}
                  </span>
                  {opt}
                  {selected !== null && idx === q.correct && (
                    <span style={{ marginLeft: "auto", paddingLeft: 12, color: "#4ade80", fontSize: 18 }}>✓</span>
                  )}
                  {selected !== null && idx === selected && idx !== q.correct && (
                    <span style={{ marginLeft: "auto", paddingLeft: 12, color: "#f87171", fontSize: 18 }}>✗</span>
                  )}
                </button>
              ))}
            </div>

            {/* Feedback */}
            {selected !== null && (
              <div style={{
                margin: "0 28px 28px", padding: "14px 18px", borderRadius: 12,
                background: selected === q.correct ? "rgba(34,197,94,0.1)" : "rgba(239,68,68,0.1)",
                border: `1px solid ${selected === q.correct ? "rgba(34,197,94,0.25)" : "rgba(239,68,68,0.25)"}`,
                color: selected === q.correct ? "#4ade80" : "#f87171",
                fontSize: 14, fontWeight: 500
              }}>
                {selected === q.correct ? "🎯 Correct! Well done." : `❌ Incorrect. The correct answer was: "${q.options[q.correct]}"`}
              </div>
            )}
          </div>
        </div>
      )}

      {/* ── RESULTS SCREEN ── */}
      {phase === "result" && (
        <div style={{ maxWidth: 680, width: "100%" }}>
          <div style={{ textAlign: "center", marginBottom: 48 }}>
            <div style={{ fontSize: 56, marginBottom: 16 }}>
              {score >= 6 ? "🏆" : score >= 4 ? "🎯" : score >= 2 ? "💪" : "📚"}
            </div>
            <h2 style={{
              fontFamily: "'Syne', sans-serif", fontSize: "clamp(36px, 6vw, 52px)",
              fontWeight: 800, margin: "0 0 12px",
              background: score >= 6
                ? "linear-gradient(135deg, #22c55e, #4ade80)"
                : score >= 4 ? "linear-gradient(135deg, #00d4ff, #a855f7)"
                  : "linear-gradient(135deg, #ff9500, #ff6b35)",
              WebkitBackgroundClip: "text", WebkitTextFillColor: "transparent"
            }}>
              {score >= 6 ? "Outstanding!" : score >= 4 ? "Good Work!" : score >= 2 ? "Keep Practicing!" : "Don't Give Up!"}
            </h2>
            <p style={{ color: "rgba(255,255,255,0.4)", fontSize: 16, margin: 0 }}>
              Final Score: <strong style={{ color: "#fff", fontFamily: "'Space Mono', monospace", fontSize: 20 }}>
                {score > 0 ? "+" : ""}{score}
              </strong> out of {QUIZ_DATA.length} questions
            </p>
          </div>

          {/* Results list */}
          <div style={{ display: "flex", flexDirection: "column", gap: 10, marginBottom: 40 }}>
            {results.map((r, i) => (
              <div key={i} style={{
                background: "rgba(255,255,255,0.03)", borderRadius: 14,
                border: `1px solid ${r.timeout ? "rgba(255,149,0,0.2)" : r.chosen === r.correct ? "rgba(34,197,94,0.15)" : "rgba(239,68,68,0.15)"}`,
                padding: "16px 20px", display: "flex", alignItems: "flex-start", gap: 14
              }}>
                <div style={{
                  width: 32, height: 32, borderRadius: 10, flexShrink: 0,
                  display: "flex", alignItems: "center", justifyContent: "center",
                  fontSize: 16,
                  background: r.timeout ? "rgba(255,149,0,0.15)" : r.chosen === r.correct ? "rgba(34,197,94,0.15)" : "rgba(239,68,68,0.15)"
                }}>
                  {r.timeout ? "⏱" : r.chosen === r.correct ? "✓" : "✗"}
                </div>
                <div style={{ flex: 1, minWidth: 0 }}>
                  <div style={{ fontSize: 14, color: "#e8eaf0", marginBottom: 4, lineHeight: 1.4 }}>{r.question}</div>
                  {r.timeout ? (
                    <div style={{ fontSize: 12, color: "#ff9500" }}>Timed out — correct: "{r.options[r.correct]}"</div>
                  ) : r.chosen !== r.correct ? (
                    <div style={{ fontSize: 12, color: "#f87171" }}>
                      Your answer: "{r.options[r.chosen]}" · Correct: "{r.options[r.correct]}"
                    </div>
                  ) : (
                    <div style={{ fontSize: 12, color: "#4ade80" }}>"{r.options[r.correct]}"</div>
                  )}
                </div>
                <span style={{
                  fontSize: 11, padding: "3px 8px", borderRadius: 999,
                  border: `1px solid ${categoryColors[r.category]}33`,
                  color: categoryColors[r.category], flexShrink: 0,
                  fontFamily: "'Space Mono', monospace"
                }}>{r.category}</span>
              </div>
            ))}
          </div>

          <div style={{ textAlign: "center" }}>
            <button onClick={startQuiz} style={{
              padding: "16px 48px", borderRadius: 999,
              background: "linear-gradient(135deg, #00d4ff, #0099cc)",
              border: "none", color: "#080b14", fontSize: 16, fontWeight: 700,
              cursor: "pointer", fontFamily: "'DM Sans', sans-serif",
              boxShadow: "0 0 40px rgba(0,212,255,0.25)",
              transition: "transform 0.2s"
            }}
              onMouseEnter={e => e.target.style.transform = "scale(1.04)"}
              onMouseLeave={e => e.target.style.transform = "scale(1)"}
            >Try Again →</button>
          </div>
        </div>
      )}
    </div>
  );
}
