# Dashboard Responsivo em Flutter

**Atividade Prática - Aula 6** 
**Disciplina:** Desenvolvimento para Dispositivos Móveis
**Instituição:** FACULDADE SENAC JOINVILLE
**Turma:** 5ª Fase Análise e Desenvolvimento de Sistemas 2026/1

---

## 📱 Sobre o Projeto Este projeto consiste na criação de um dashboard responsivo que se adapta automaticamente a diferentes tamanhos de tela (Mobile, Tablet e Desktop). 
 A interface reorganiza seus elementos baseando-se na largura da tela utilizando `MediaQuery`, distribuindo o espaço com `Expanded` e `Flexible`, e criando sobreposições de elementos visuais com `Stack` e `Positioned`. 

### 📐 Breakpoints Implementados
| Dispositivo   | Largura         | Layout                                        |
| :---          | :---            | :---                                          |
| **Mobile**    | `< 600px`       | `Column` - 1 card por linha (vertical)        |
| **Tablet**    | `600px - 900px` | `Wrap` - 2 cards por linha (grid 2x2)         |
| **Desktop**   | `> 900px`       | `Row` - 4 cards na mesma linha (horizontal)   |

### 🚀 Bônus Implementados
* **Valores Dinâmicos e Interativos:** Implementação de `StatefulWidget` para gerar valores randomizados (`Mock`) sempre que o app é iniciado ou atualizado.
* **Formatadores:** Formatação visual de moedas (R$) e separadores de milhar.
* **Efeitos Visuais:** Uso de `Stack` e `Positioned` para criar ícones de marca d'água no fundo dos cards.
* **Interatividade:** Cards clicáveis com efeito cascata (Ripple/`InkWell`), botões de "Detalhes" e exibição de alertas (`SnackBar`) para feedback do usuário.

---

## 📸 Screenshots dos Layouts

### 1. Mobile (< 600px)
![Layout Mobile](./assets/mobile.png)

### 2. Tablet (600px - 900px)
![Layout Tablet](./assets/tablet.png)

### 3. Desktop (> 900px)
![Layout Desktop](./assets/desktop.png)