import { useState } from “react”;

const CURRENCIES = [
{ code: “EUR”, symbol: “€”, flag: “🇪🇺” },
{ code: “USD”, symbol: “$”, flag: “🇺🇸” },
{ code: “GBP”, symbol: “£”, flag: “🇬🇧” },
{ code: “XOF”, symbol: “FCFA”, flag: “🌍” },
{ code: “MAD”, symbol: “DH”, flag: “🇲🇦” },
{ code: “CAD”, symbol: “CA$”, flag: “🇨🇦” },
{ code: “NGN”, symbol: “₦”, flag: “🇳🇬” },
{ code: “GHS”, symbol: “₵”, flag: “🇬🇭” },
];

const CATEGORIES = [
{ id: “home”, icon: “🏠”, label: “Maison” },
{ id: “travel”, icon: “✈️”, label: “Voyage” },
{ id: “education”, icon: “🎓”, label: “Études” },
{ id: “business”, icon: “💼”, label: “Business” },
{ id: “wedding”, icon: “💍”, label: “Mariage” },
{ id: “car”, icon: “🚗”, label: “Voiture” },
{ id: “health”, icon: “🏥”, label: “Santé” },
{ id: “other”, icon: “⭐”, label: “Autre” },
];

const TABS = [
{ id: “dashboard”, label: “Accueil”, icon: “◈” },
{ id: “projects”, label: “Projets”, icon: “◉” },
{ id: “plans”, label: “Plans”, icon: “◇” },
{ id: “more”, label: “Plus”, icon: “≡” },
];

export default function ProG() {
const [tab, setTab] = useState(“dashboard”);
const [currency, setCurrency] = useState(CURRENCIES[0]);
const [projects, setProjects] = useState([]);
const [showNew, setShowNew] = useState(false);
const [activeProject, setActiveProject] = useState(null);
const [deposit, setDeposit] = useState(””);
const [form, setForm] = useState({ name: “”, category: “home”, goal: “”, currency: “EUR”, deadline: “” });
const [toast, setToast] = useState(null);
const [selectedPlan, setSelectedPlan] = useState(“free”);

const notify = (msg, type = “ok”) => {
setToast({ msg, type });
setTimeout(() => setToast(null), 2800);
};

const getCur = (code) => CURRENCIES.find(c => c.code === code) || CURRENCIES[0];
const getCat = (id) => CATEGORIES.find(c => c.id === id) || CATEGORIES[0];

const handleDeposit = () => {
const amt = parseFloat(deposit);
if (!amt || amt <= 0) return notify(“Montant invalide”, “err”);
setProjects(prev => prev.map(p =>
p.id === activeProject.id ? { …p, saved: Math.min(p.saved + amt, p.goal) } : p
));
setActiveProject(prev => ({ …prev, saved: Math.min(prev.saved + amt, prev.goal) }));
setDeposit(””);
notify(`+${amt} ${activeProject.currency} ajouté ✓`);
};

const handleCreate = () => {
if (!form.name || !form.goal || !form.deadline) return notify(“Remplissez tous les champs”, “err”);
setProjects(prev => […prev, { id: Date.now(), …form, goal: parseFloat(form.goal), saved: 0 }]);
setShowNew(false);
setForm({ name: “”, category: “home”, goal: “”, currency: “EUR”, deadline: “” });
notify(“Projet créé 🎉”);
};

const totalSaved = projects.reduce((a, p) => a + p.saved, 0);
const totalGoal = projects.reduce((a, p) => a + p.goal, 0);
const globalPct = totalGoal > 0 ? Math.round((totalSaved / totalGoal) * 100) : 0;

return (
<div style={{ minHeight: “100vh”, background: “#F5F4F0”, fontFamily: “‘Inter’, ‘Helvetica Neue’, sans-serif”, color: “#1A1A1A”, display: “flex”, flexDirection: “column” }}>
<style>{`
@import url(‘https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap’);
* { box-sizing: border-box; margin: 0; padding: 0; }
body { background: #F5F4F0; }

```
    @keyframes up { from { opacity:0; transform:translateY(16px) } to { opacity:1; transform:translateY(0) } }
    @keyframes pop { 0%{transform:scale(0.92)} 60%{transform:scale(1.04)} 100%{transform:scale(1)} }
    @keyframes toast { 0%{opacity:0;transform:translateY(12px)} 15%,85%{opacity:1;transform:translateY(0)} 100%{opacity:0} }

    .fade { animation: up 0.35s cubic-bezier(.22,1,.36,1) both; }
    .pop { animation: pop 0.3s cubic-bezier(.22,1,.36,1) both; }

    input, select, button { font-family: inherit; }

    .pill-btn {
      border: none; border-radius: 99px; cursor: pointer;
      font-weight: 600; font-size: 13px; padding: 10px 20px;
      transition: all 0.18s; letter-spacing: -0.1px;
    }

    .card {
      background: #fff;
      border-radius: 20px;
      padding: 20px;
      animation: up 0.35s cubic-bezier(.22,1,.36,1) both;
    }

    .input {
      width: 100%; border: 1.5px solid #E8E8E4;
      border-radius: 12px; padding: 13px 16px;
      font-size: 14px; background: #FAFAF8; color: #1A1A1A;
      outline: none; transition: border 0.15s;
    }
    .input:focus { border-color: #1A1A1A; background: #fff; }
    .input::placeholder { color: #BDBDB8; }

    .overlay {
      position: fixed; inset: 0;
      background: rgba(26,26,26,0.45);
      backdrop-filter: blur(6px);
      z-index: 200; display: flex; align-items: flex-end;
      animation: up 0.2s ease;
    }
    .sheet {
      background: #fff; border-radius: 28px 28px 0 0;
      width: 100%; padding: 28px 24px 36px;
      max-height: 92vh; overflow-y: auto;
    }

    .tab-bar {
      position: fixed; bottom: 0; left: 0; right: 0;
      background: rgba(255,255,255,0.96);
      backdrop-filter: blur(20px);
      border-top: 1px solid #EEEEE8;
      display: flex; padding: 10px 0 20px;
      z-index: 100;
    }
    .tab-item {
      flex: 1; display: flex; flex-direction: column; align-items: center;
      gap: 4px; cursor: pointer; border: none; background: none;
      font-size: 10px; font-weight: 600; color: #BDBDB8;
      letter-spacing: 0.3px; text-transform: uppercase; padding: 4px 0;
      transition: color 0.2s;
    }
    .tab-item.active { color: #1A1A1A; }
    .tab-icon { font-size: 20px; transition: transform 0.2s; }
    .tab-item.active .tab-icon { transform: scale(1.15); }

    .progress-track { height: 6px; background: #F0F0EC; border-radius: 99px; overflow: hidden; }
    .progress-fill { height: 100%; border-radius: 99px; background: #1A1A1A; transition: width 0.8s cubic-bezier(.22,1,.36,1); }
    .progress-fill.done { background: #22C55E; }

    .cat-btn {
      border: 1.5px solid #E8E8E4; border-radius: 12px;
      padding: 10px 14px; background: #FAFAF8; cursor: pointer;
      font-size: 12px; font-weight: 600; color: #6B6B68;
      transition: all 0.15s; white-space: nowrap;
    }
    .cat-btn.active { border-color: #1A1A1A; background: #1A1A1A; color: #fff; }

    .plan-row {
      border: 1.5px solid #E8E8E4; border-radius: 16px; padding: 18px 16px;
      cursor: pointer; transition: all 0.2s; background: #fff;
      display: flex; align-items: center; gap: 14px;
    }
    .plan-row.active { border-color: #1A1A1A; background: #1A1A1A; color: #fff; }
    .plan-row:hover:not(.active) { border-color: #BDBDB8; }

    .chip {
      display: inline-flex; align-items: center; gap: 4px;
      padding: 4px 10px; border-radius: 99px;
      font-size: 11px; font-weight: 700; letter-spacing: 0.2px;
    }
  `}</style>

  {/* Toast */}
  {toast && (
    <div style={{
      position: "fixed", top: 24, left: "50%", transform: "translateX(-50%)",
      background: toast.type === "err" ? "#FF3B30" : "#1A1A1A",
      color: "#fff", padding: "12px 22px", borderRadius: 14,
      fontWeight: 600, fontSize: 13, zIndex: 999,
      animation: "toast 2.8s ease forwards",
      whiteSpace: "nowrap", boxShadow: "0 8px 24px rgba(0,0,0,0.18)",
    }}>{toast.msg}</div>
  )}

  {/* ── CONTENT ── */}
  <div style={{ flex: 1, maxWidth: 480, width: "100%", margin: "0 auto", padding: "0 0 100px" }}>

    {/* ═══ DASHBOARD ═══ */}
    {tab === "dashboard" && (
      <div className="fade" style={{ padding: "48px 20px 0" }}>

        {/* Header */}
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 32 }}>
          <div>
            <p style={{ fontSize: 13, color: "#BDBDB8", fontWeight: 500, marginBottom: 4 }}>Bonjour 👋</p>
            <h1 style={{ fontSize: 28, fontWeight: 800, letterSpacing: "-0.8px", lineHeight: 1.1 }}>
              Pro<span style={{ color: "#BDBDB8" }}>.G</span>
            </h1>
          </div>
          <div style={{
            width: 40, height: 40, borderRadius: 12, background: "#1A1A1A",
            display: "flex", alignItems: "center", justifyContent: "center",
            color: "#fff", fontWeight: 800, fontSize: 16, letterSpacing: -1,
          }}>G</div>
        </div>

        {/* Balance Card */}
        <div style={{
          background: "#1A1A1A", borderRadius: 24, padding: "28px 24px",
          marginBottom: 20, position: "relative", overflow: "hidden",
        }}>
          <div style={{
            position: "absolute", top: -40, right: -40,
            width: 150, height: 150, borderRadius: "50%",
            background: "rgba(255,255,255,0.04)",
          }} />
          <p style={{ color: "rgba(255,255,255,0.45)", fontSize: 12, fontWeight: 600, letterSpacing: 1, textTransform: "uppercase", marginBottom: 10 }}>
            Épargne totale
          </p>
          <p style={{ color: "#fff", fontSize: 40, fontWeight: 800, letterSpacing: "-1.5px", marginBottom: 4 }}>
            0 <span style={{ fontSize: 22, fontWeight: 500, color: "rgba(255,255,255,0.4)" }}>{currency.symbol}</span>
          </p>
          <p style={{ color: "rgba(255,255,255,0.3)", fontSize: 12, marginBottom: 20 }}>
            Aucun projet · objectif 0 {currency.symbol}
          </p>
          <div className="progress-track" style={{ background: "rgba(255,255,255,0.1)" }}>
            <div className="progress-fill" style={{ width: "0%", background: "#fff" }} />
          </div>
          <p style={{ color: "rgba(255,255,255,0.3)", fontSize: 11, marginTop: 8 }}>0% de l'objectif atteint</p>
        </div>

        {/* Currency strip */}
        <div style={{ marginBottom: 24 }}>
          <p style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", letterSpacing: 1, textTransform: "uppercase", marginBottom: 10 }}>Devise</p>
          <div style={{ display: "flex", gap: 8, overflowX: "auto", paddingBottom: 4 }}>
            {CURRENCIES.map(c => (
              <button key={c.code} onClick={() => setCurrency(c)} style={{
                flexShrink: 0, padding: "8px 14px", borderRadius: 10,
                border: `1.5px solid ${currency.code === c.code ? "#1A1A1A" : "#E8E8E4"}`,
                background: currency.code === c.code ? "#1A1A1A" : "#fff",
                color: currency.code === c.code ? "#fff" : "#6B6B68",
                cursor: "pointer", fontSize: 12, fontWeight: 700, transition: "all 0.15s",
              }}>
                {c.flag} {c.code}
              </button>
            ))}
          </div>
        </div>

        {/* Empty state CTA */}
        <div style={{ textAlign: "center", padding: "32px 16px" }}>
          <div style={{ fontSize: 48, marginBottom: 12 }}>🏦</div>
          <p style={{ fontWeight: 700, fontSize: 16, marginBottom: 6 }}>Aucun projet d'épargne</p>
          <p style={{ color: "#BDBDB8", fontSize: 13, lineHeight: 1.6, marginBottom: 24 }}>
            Créez votre premier projet pour commencer à épargner vers vos objectifs.
          </p>
          <button className="pill-btn" onClick={() => setTab("projects")} style={{ background: "#1A1A1A", color: "#fff", padding: "14px 28px", fontSize: 14 }}>
            Créer un projet →
          </button>
        </div>
      </div>
    )}

    {/* ═══ PROJECTS ═══ */}
    {tab === "projects" && (
      <div className="fade" style={{ padding: "48px 20px 0" }}>
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 28 }}>
          <div>
            <p style={{ fontSize: 12, color: "#BDBDB8", fontWeight: 500, marginBottom: 2 }}>Mes projets</p>
            <h2 style={{ fontSize: 24, fontWeight: 800, letterSpacing: "-0.6px" }}>
              {projects.length === 0 ? "Aucun projet" : `${projects.length} projet${projects.length > 1 ? "s" : ""}`}
            </h2>
          </div>
          <button className="pill-btn" onClick={() => setShowNew(true)} style={{ background: "#1A1A1A", color: "#fff", padding: "11px 18px" }}>
            + Nouveau
          </button>
        </div>

        {projects.length === 0 ? (
          <div style={{ textAlign: "center", padding: "60px 20px" }}>
            <div style={{ fontSize: 56, marginBottom: 16 }}>📂</div>
            <p style={{ fontWeight: 700, fontSize: 16, marginBottom: 8 }}>Aucun projet pour l'instant</p>
            <p style={{ color: "#BDBDB8", fontSize: 13, lineHeight: 1.6 }}>
              Appuyez sur <strong>+ Nouveau</strong> pour créer votre premier projet d'épargne.
            </p>
          </div>
        ) : (
          <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
            {projects.map((p, i) => {
              const cur = getCur(p.currency);
              const cat = getCat(p.category);
              const pct = Math.min(100, Math.round((p.saved / p.goal) * 100));
              const daysLeft = Math.max(0, Math.ceil((new Date(p.deadline) - new Date()) / 86400000));
              return (
                <div key={p.id} className="card" style={{ animationDelay: `${i * 0.07}s`, cursor: "pointer" }}
                  onClick={() => setActiveProject(p)}>
                  <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 16 }}>
                    <div style={{ display: "flex", gap: 12, alignItems: "center" }}>
                      <div style={{ width: 42, height: 42, borderRadius: 12, background: "#F5F4F0", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 20 }}>
                        {cat.icon}
                      </div>
                      <div>
                        <p style={{ fontWeight: 700, fontSize: 15, marginBottom: 2 }}>{p.name}</p>
                        <p style={{ color: "#BDBDB8", fontSize: 12 }}>{cur.flag} {p.currency} · {daysLeft}j restants</p>
                      </div>
                    </div>
                    <span className="chip" style={{ background: "#F5F4F0", color: "#6B6B68", fontSize: 10 }}>
                      🔒 Bloqué
                    </span>
                  </div>

                  <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 8 }}>
                    <span style={{ fontWeight: 800, fontSize: 17, letterSpacing: "-0.3px" }}>
                      {p.saved.toLocaleString("fr-FR")} <span style={{ color: "#BDBDB8", fontWeight: 500, fontSize: 13 }}>{cur.symbol}</span>
                    </span>
                    <span style={{ color: "#BDBDB8", fontSize: 13 }}>/ {p.goal.toLocaleString("fr-FR")} {cur.symbol}</span>
                  </div>

                  <div className="progress-track" style={{ marginBottom: 6 }}>
                    <div className={`progress-fill ${pct >= 100 ? "done" : ""}`} style={{ width: `${pct}%` }} />
                  </div>
                  <p style={{ fontSize: 11, color: pct >= 100 ? "#22C55E" : "#BDBDB8", fontWeight: 600 }}>
                    {pct >= 100 ? "✓ Objectif atteint !" : `${pct}%`}
                  </p>
                </div>
              );
            })}
          </div>
        )}
      </div>
    )}

    {/* ═══ PLANS ═══ */}
    {tab === "plans" && (
      <div className="fade" style={{ padding: "48px 20px 0" }}>
        <p style={{ fontSize: 12, color: "#BDBDB8", fontWeight: 500, marginBottom: 4 }}>Abonnement</p>
        <h2 style={{ fontSize: 24, fontWeight: 800, letterSpacing: "-0.6px", marginBottom: 6 }}>Choisissez votre plan</h2>
        <p style={{ color: "#BDBDB8", fontSize: 13, marginBottom: 28 }}>Commencez gratuitement.</p>

        <div style={{ display: "flex", flexDirection: "column", gap: 12, marginBottom: 32 }}>
          {[
            { id: "free", name: "Starter", price: "Gratuit", fee: "2.5%", desc: "1 projet · Objectif max 5 000 · Retraits 5 jours" },
            { id: "pro", name: "Pro", price: "4,99 €/mois", fee: "1.5%", desc: "5 projets · Objectif illimité · Retraits 24h", popular: true },
            { id: "elite", name: "Elite", price: "12,99 €/mois", fee: "0.8%", desc: "Projets illimités · Retraits instantanés · API accès" },
          ].map((plan, i) => (
            <div key={plan.id} className={`plan-row ${selectedPlan === plan.id ? "active" : ""}`}
              style={{ animationDelay: `${i * 0.08}s` }}
              onClick={() => { setSelectedPlan(plan.id); notify(`Plan ${plan.name} sélectionné`); }}>
              <div style={{ flex: 1 }}>
                <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 4 }}>
                  <p style={{ fontWeight: 700, fontSize: 15 }}>{plan.name}</p>
                  {plan.popular && (
                    <span style={{
                      fontSize: 9, fontWeight: 800, padding: "2px 8px", borderRadius: 99, letterSpacing: 0.5,
                      background: selectedPlan === plan.id ? "rgba(255,255,255,0.15)" : "#F0F0EC",
                      color: selectedPlan === plan.id ? "#fff" : "#6B6B68",
                    }}>POPULAIRE</span>
                  )}
                </div>
                <p style={{ fontSize: 12, color: selectedPlan === plan.id ? "rgba(255,255,255,0.5)" : "#BDBDB8", lineHeight: 1.5 }}>{plan.desc}</p>
              </div>
              <div style={{ textAlign: "right", flexShrink: 0 }}>
                <p style={{ fontWeight: 800, fontSize: 14 }}>{plan.price}</p>
                <p style={{ fontSize: 11, color: selectedPlan === plan.id ? "rgba(255,255,255,0.4)" : "#BDBDB8", marginTop: 2 }}>{plan.fee} retrait</p>
              </div>
            </div>
          ))}
        </div>

        <div style={{ background: "#F5F4F0", borderRadius: 16, padding: 18 }}>
          <p style={{ fontWeight: 700, fontSize: 13, marginBottom: 10 }}>Fonctionnalités à venir</p>
          <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
            {[
              ["🤖", "IA Coach Épargne — Suggestions personnalisées"],
              ["👥", "Épargne Collective — Projets partagés"],
              ["🔄", "Virements Automatiques — Connexion bancaire"],
              ["🎮", "Gamification — Badges et récompenses"],
              ["📊", "Projections — Simulation graphique"],
              ["💎", "Pro.G Invest — Épargne productive"],
            ].map(([icon, text], i) => (
              <div key={i} style={{ display: "flex", gap: 10, alignItems: "flex-start", fontSize: 12, color: "#6B6B68" }}>
                <span>{icon}</span><span>{text}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    )}

    {/* ═══ MORE ═══ */}
    {tab === "more" && (
      <div className="fade" style={{ padding: "48px 20px 0" }}>
        <p style={{ fontSize: 12, color: "#BDBDB8", fontWeight: 500, marginBottom: 4 }}>Menu</p>
        <h2 style={{ fontSize: 24, fontWeight: 800, letterSpacing: "-0.6px", marginBottom: 24 }}>Plus</h2>

        <div style={{ display: "flex", flexDirection: "column", gap: 8 }}>
          {[
            ["🏗️", "Architecture technique", "Stack & intégrations API"],
            ["⚖️", "Conformité légale", "KYC, AML, Agrément EMI"],
            ["💰", "Modèle économique", "Sources de revenus"],
            ["🔔", "Notifications", "Gérer les alertes"],
            ["🔐", "Sécurité", "Authentification & données"],
            ["❓", "Aide & support", "FAQ et contact"],
          ].map(([icon, title, desc], i) => (
            <button key={i} onClick={() => notify("Disponible bientôt")} style={{
              display: "flex", alignItems: "center", gap: 14, padding: "16px 18px",
              background: "#fff", border: "none", borderRadius: 16, cursor: "pointer",
              textAlign: "left", width: "100%", transition: "opacity 0.15s",
              animationDelay: `${i * 0.05}s`,
            }}>
              <div style={{ width: 40, height: 40, borderRadius: 11, background: "#F5F4F0", display: "flex", alignItems: "center", justifyContent: "center", fontSize: 18 }}>
                {icon}
              </div>
              <div style={{ flex: 1 }}>
                <p style={{ fontWeight: 600, fontSize: 14, marginBottom: 2 }}>{title}</p>
                <p style={{ color: "#BDBDB8", fontSize: 12 }}>{desc}</p>
              </div>
              <span style={{ color: "#BDBDB8", fontSize: 18 }}>›</span>
            </button>
          ))}
        </div>

        <div style={{ marginTop: 24, textAlign: "center" }}>
          <p style={{ fontWeight: 900, fontSize: 15, letterSpacing: "-0.3px" }}>Pro<span style={{ color: "#BDBDB8" }}>.G</span></p>
          <p style={{ color: "#BDBDB8", fontSize: 11, marginTop: 4 }}>Version 1.0.0 · Prototype</p>
        </div>
      </div>
    )}
  </div>

  {/* ── TAB BAR ── */}
  <div className="tab-bar">
    {TABS.map(t => (
      <button key={t.id} className={`tab-item ${tab === t.id ? "active" : ""}`} onClick={() => setTab(t.id)}>
        <span className="tab-icon">{t.icon}</span>
        {t.label}
      </button>
    ))}
  </div>

  {/* ── SHEET: Déposer ── */}
  {activeProject && (
    <div className="overlay" onClick={() => { setActiveProject(null); setDeposit(""); }}>
      <div className="sheet" onClick={e => e.stopPropagation()}>
        <div style={{ width: 36, height: 4, background: "#E8E8E4", borderRadius: 99, margin: "0 auto 24px" }} />

        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: 20 }}>
          <div>
            <p style={{ fontWeight: 800, fontSize: 18, letterSpacing: "-0.4px" }}>{activeProject.name}</p>
            <p style={{ color: "#BDBDB8", fontSize: 12, marginTop: 2 }}>
              {getCat(activeProject.category).icon} · {getCur(activeProject.currency).flag} {activeProject.currency}
            </p>
          </div>
          <button onClick={() => { setActiveProject(null); setDeposit(""); }} style={{ border: "none", background: "#F5F4F0", borderRadius: 99, width: 32, height: 32, cursor: "pointer", fontSize: 14, color: "#6B6B68" }}>✕</button>
        </div>

        {/* Progress */}
        <div style={{ background: "#F5F4F0", borderRadius: 16, padding: 16, marginBottom: 20 }}>
          <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 10 }}>
            <span style={{ fontWeight: 800, fontSize: 18, letterSpacing: "-0.4px" }}>
              {activeProject.saved.toLocaleString("fr-FR")} <span style={{ color: "#BDBDB8", fontWeight: 500, fontSize: 13 }}>{getCur(activeProject.currency).symbol}</span>
            </span>
            <span style={{ color: "#BDBDB8", fontSize: 13, alignSelf: "flex-end" }}>
              / {activeProject.goal.toLocaleString("fr-FR")} {getCur(activeProject.currency).symbol}
            </span>
          </div>
          <div className="progress-track">
            <div className={`progress-fill ${Math.round((activeProject.saved / activeProject.goal) * 100) >= 100 ? "done" : ""}`}
              style={{ width: `${Math.min(100, Math.round((activeProject.saved / activeProject.goal) * 100))}%` }} />
          </div>
          <p style={{ fontSize: 11, color: "#BDBDB8", marginTop: 6, fontWeight: 600 }}>
            {Math.min(100, Math.round((activeProject.saved / activeProject.goal) * 100))}% · Manque {Math.max(0, activeProject.goal - activeProject.saved).toLocaleString("fr-FR")} {getCur(activeProject.currency).symbol}
          </p>
        </div>

        <label style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", display: "block", marginBottom: 8, letterSpacing: 0.8, textTransform: "uppercase" }}>
          Montant ({activeProject.currency})
        </label>
        <input className="input" type="number" placeholder="0,00" value={deposit} onChange={e => setDeposit(e.target.value)} style={{ fontSize: 18, fontWeight: 700, marginBottom: 12 }} />

        <div style={{ display: "flex", gap: 8, marginBottom: 20 }}>
          {[50, 100, 500, 1000].map(a => (
            <button key={a} onClick={() => setDeposit(String(a))} style={{
              flex: 1, border: "1.5px solid #E8E8E4", borderRadius: 10, background: "#FAFAF8",
              padding: "9px 0", fontSize: 12, fontWeight: 700, cursor: "pointer",
              color: deposit === String(a) ? "#fff" : "#6B6B68",
              background: deposit === String(a) ? "#1A1A1A" : "#FAFAF8",
              transition: "all 0.15s",
            }}>+{a}</button>
          ))}
        </div>

        <button className="pill-btn" onClick={handleDeposit} style={{
          width: "100%", background: "#1A1A1A", color: "#fff",
          padding: "16px", fontSize: 15, borderRadius: 16,
        }}>
          Déposer {deposit ? `${parseFloat(deposit || 0).toLocaleString("fr-FR")} ${activeProject.currency}` : ""}
        </button>
        <p style={{ textAlign: "center", fontSize: 11, color: "#BDBDB8", marginTop: 10 }}>
          Frais de retrait · Plan actuel : {selectedPlan === "elite" ? "0.8%" : selectedPlan === "pro" ? "1.5%" : "2.5%"}
        </p>
      </div>
    </div>
  )}

  {/* ── SHEET: Nouveau projet ── */}
  {showNew && (
    <div className="overlay" onClick={() => setShowNew(false)}>
      <div className="sheet" onClick={e => e.stopPropagation()}>
        <div style={{ width: 36, height: 4, background: "#E8E8E4", borderRadius: 99, margin: "0 auto 24px" }} />
        <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", marginBottom: 22 }}>
          <h3 style={{ fontWeight: 800, fontSize: 20, letterSpacing: "-0.5px" }}>Nouveau projet</h3>
          <button onClick={() => setShowNew(false)} style={{ border: "none", background: "#F5F4F0", borderRadius: 99, width: 32, height: 32, cursor: "pointer", fontSize: 14, color: "#6B6B68" }}>✕</button>
        </div>

        <div style={{ display: "flex", flexDirection: "column", gap: 16 }}>
          <div>
            <label style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", display: "block", marginBottom: 8, letterSpacing: 0.8, textTransform: "uppercase" }}>Nom du projet</label>
            <input className="input" placeholder="ex: Voyage Tokyo, Villa..." value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} />
          </div>

          <div>
            <label style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", display: "block", marginBottom: 8, letterSpacing: 0.8, textTransform: "uppercase" }}>Catégorie</label>
            <div style={{ display: "flex", flexWrap: "wrap", gap: 8 }}>
              {CATEGORIES.map(cat => (
                <button key={cat.id} className={`cat-btn ${form.category === cat.id ? "active" : ""}`}
                  onClick={() => setForm(f => ({ ...f, category: cat.id }))}>
                  {cat.icon} {cat.label}
                </button>
              ))}
            </div>
          </div>

          <div style={{ display: "grid", gridTemplateColumns: "1fr 1fr", gap: 10 }}>
            <div>
              <label style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", display: "block", marginBottom: 8, letterSpacing: 0.8, textTransform: "uppercase" }}>Devise</label>
              <select className="input" value={form.currency} onChange={e => setForm(f => ({ ...f, currency: e.target.value }))}>
                {CURRENCIES.map(c => <option key={c.code} value={c.code}>{c.flag} {c.code}</option>)}
              </select>
            </div>
            <div>
              <label style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", display: "block", marginBottom: 8, letterSpacing: 0.8, textTransform: "uppercase" }}>Objectif</label>
              <input className="input" type="number" placeholder="10 000" value={form.goal} onChange={e => setForm(f => ({ ...f, goal: e.target.value }))} />
            </div>
          </div>

          <div>
            <label style={{ fontSize: 11, fontWeight: 700, color: "#BDBDB8", display: "block", marginBottom: 8, letterSpacing: 0.8, textTransform: "uppercase" }}>Date limite</label>
            <input className="input" type="date" value={form.deadline} onChange={e => setForm(f => ({ ...f, deadline: e.target.value }))} />
          </div>

          <button className="pill-btn" onClick={handleCreate} style={{
            width: "100%", background: "#1A1A1A", color: "#fff",
            padding: "16px", fontSize: 15, borderRadius: 16, marginTop: 4,
          }}>
            Créer le projet
          </button>
        </div>
      </div>
    </div>
  )}
</div>
```

);
}