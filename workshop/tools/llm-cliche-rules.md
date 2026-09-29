# LLM Prose Cliché Rules Reference

This document is the authoritative rule set for detecting and flagging LLM writing clichés in prose. It is intended for use by an editing skill. Each rule describes a pattern, explains why it is a cliché, provides concrete examples, and states what to flag.

When applying these rules, flag every instance — do not pick the worst offenders and ignore the rest. The goal is exhaustive detection. Cluster your findings by category. For each flagged item, quote the exact phrase, name the rule it violates, and suggest a direction for revision (but do not rewrite the text yourself unless explicitly asked).

---

## CATEGORY 1 — FORBIDDEN VOCABULARY (Lexical Red Flags)

### Rule 1.1 — The Delve Family
**Flag any use of the following verbs:**
delve, underscore, embark, harness, leverage, utilize (when "use" would suffice), empower, enable, enhance, elevate, foster, streamline, optimize, illuminate, unlock, unleash, revolutionize, navigate (metaphorical use), facilitate, resonate, garner, bolster, craft (as a verb applied to abstract things), strive, thrive, augment, amplify, exemplify, elucidate, spearhead, supercharge, showcase.

**Why it's a cliché:** These verbs are statistically 10–162× more frequent in LLM output than in human writing. "Delve" alone increased 10.5× in academic writing post-ChatGPT. They feel elevated but carry no specific meaning.

**Example of offending use:** "Let's delve into the nuances of this issue." / "This approach harnesses the power of collaboration."

**Flag instruction:** Flag every instance. Even one use of "delve" in a manuscript is suspicious. Multiple uses in proximity are nearly certain AI contamination.

---

### Rule 1.2 — Inflation Adjectives
**Flag any use of the following adjectives:**
intricate, meticulous, pivotal, commendable, innovative, versatile, noteworthy, invaluable, comprehensive, multifaceted, nuanced (as a vague filler), robust, seamless, cutting-edge, groundbreaking, unprecedented, transformative, dynamic, holistic, exemplary, vibrant, profound (as a filler), paramount, formidable, ever-evolving, palpable (in non-sensory contexts), seminal, compelling, thought-provoking, game-changing, revolutionary, impactful.

**Why it's a cliché:** LLMs inflate everything. "Important" becomes "pivotal." "Complex" becomes "intricate" or "multifaceted." "Good" becomes "commendable." The adjectives are real words but become meaningless through overuse and misapplication. "Intricate" rose 117% in one year in academic writing due to LLM use.

**Example of offending use:** "This represents a pivotal moment in the evolution of the narrative." / "The multifaceted challenges of modern life."

**Flag instruction:** Flag every instance. In fiction especially, flag any use of "palpable" near emotion words — "the tension was palpable" is AI's most reliable creative-writing tell.

---

### Rule 1.3 — Inflation Adverbs
**Flag any use of the following adverbs:**
meticulously, notably, importantly, fundamentally, seamlessly, innovatively, lucidly, aptly, methodically, compellingly, impressively, undoubtedly, strategically, remarkably, crucially, vitally, profoundly, unquestionably, inherently (as filler).

**Why it's a cliché:** These adverbs are LLM intensifiers — they add emphasis without adding information. "Meticulously crafted" is AI-speak for "well made." "Seamlessly integrated" means "works together."

**Flag instruction:** Flag every instance. If the adverb cannot be removed without losing specific meaning, it may be legitimate. If removing it changes nothing except intensity, it is a cliché.

---

### Rule 1.4 — The "Tapestry/Landscape" Metaphor Cluster
**Flag any use of the following as abstract metaphor vehicles:**
landscape, tapestry, realm, journey, beacon, symphony, labyrinth, dance (metaphorical), mirror (metaphorical), kaleidoscope, crucible, cornerstone, linchpin, epicenter, treasure trove, uncharted waters, fabric (of something), canvas, mosaic.

**Why it's a cliché:** LLMs reach for these image-words as reliable texture generators. They gesture toward meaning without achieving it. "A rich tapestry of experiences" is the canonical AI tell. These metaphors are deployed interchangeably — any complex topic becomes a "tapestry," any field becomes a "landscape."

**Example of offending use:** "The vibrant tapestry of cultural expression." / "Navigating the ever-evolving landscape of technology." / "In the realm of human experience."

**Flag instruction:** Flag every metaphorical use. A literal landscape (an actual stretch of terrain) is fine. "The technological landscape" is not.

---

## CATEGORY 2 — STRUCTURAL SENTENCE PATTERNS

### Rule 2.1 — The "Not X, It's Y" Negation Structure
**Pattern:** "It's not about [A] — it's about [B]." / "Success isn't [A] — it's [B]."

**Why it's a cliché:** This construction creates an illusion of reframing or insight while usually saying something obvious. LLMs deploy it reflexively. It adds no information that couldn't be conveyed with a direct statement of B.

**Example:** "It's not about working harder — it's about working smarter." / "This isn't just a story — it's a mirror held up to society."

**Flag instruction:** Flag every instance of this structure. The em-dash is often the visual tell; check any em-dash construction for this pattern.

---

### Rule 2.2 — The Mechanical Tricolon
**Pattern:** Lists of exactly three items with parallel structure, especially with perfect alliteration or rhythmic balance. "Clear, concise, and compelling." "Engage, inspire, and convert." "Innovative, efficient, and transformative."

**Why it's a cliché:** Humans use tricolons but imperfectly — they pick four items, break the parallelism, get the cadence slightly wrong. LLMs produce tricolons with corporate perfection, constantly. The tell is not the tricolon itself but its mechanical frequency and flawless structure.

**Flag instruction:** Flag tricolons that feel polished to the point of emptiness. Do not flag tricolons where the three items are genuinely specific and non-interchangeable.

---

### Rule 2.3 — Correlative Overload
**Patterns:** "Not only... but also..." / "Whether... or..." / "On the one hand... on the other hand..." / "Both... and..."

**Why it's a cliché:** These correlatives create the appearance of balanced analysis. LLMs overuse them to frame every point as two-sided. When every paragraph contains one, the effect is mechanical and exhausting.

**Flag instruction:** Flag any paragraph containing more than one correlative pair. Flag any document where these appear more than once per 300 words.

---

### Rule 2.4 — The Setup-Payoff Question Fragment
**Pattern:** A rhetorical question followed by its own answer as a fragment. "The goal? [X]." "The result? [Y]." "The problem? [Z]."

**Why it's a cliché:** This is AI's attempt at punchy, short-form prose rhythm. It became ubiquitous in LLM-generated LinkedIn posts and has since spread to other contexts. The structure is not inherently bad, but LLMs use it compulsively.

**Flag instruction:** Flag any instance of this exact punctuation pattern (noun/question → fragment answer). More than two uses in any single piece is automatic flagging.

---

### Rule 2.5 — The Pseudo-Profound Fragment Style
**Pattern:** Short declarative fragments stacked for weight. "Short sentences. No connectives. Pure impact. This is the AI style."

**Why it's a cliché:** GPT-4o and later models developed this pattern as a substitute for genuine rhetorical control. It mimics literary minimalism but is purely structural — the fragments don't earn their brevity through precise word choice, they simply withhold connective tissue.

**Flag instruction:** Flag any sustained passage (3+ consecutive fragments) that reads like manufactured intensity without the specific language to back it up.

---

## CATEGORY 3 — TRANSITIONAL AND DISCOURSE PHRASES

### Rule 3.1 — Forbidden Opening Phrases
**Flag any document or paragraph opening with:**
- "In today's fast-paced world..."
- "In the ever-evolving landscape of..."
- "In the realm of..."
- "As [society/technology/we] continue[s] to evolve..."
- "With the rise of [technology/AI/etc.]..."
- "As businesses navigate the evolving landscape of..."
- "In an era of..."
- "At the intersection of..."
- "[X] has become increasingly important in today's world..."
- "Since the dawn of..."

**Why it's a cliché:** GPTZero found "in today's fast-paced world" appearing 107× more frequently in AI text than human text. These openers are AI's default context-setter — they announce the subject without saying anything about it. Every essay cannot begin by announcing that times are changing.

**Flag instruction:** Flag every use. No exceptions.

---

### Rule 3.2 — Forbidden Transitional Connectors
**Flag consistent use of these sentence-opening connectors:**
Moreover, Furthermore, Additionally, Consequently, Notably, Indeed, Nonetheless, Subsequently, Accordingly, Thus (when not in genuinely formal/legal writing).

**Why it's a cliché:** These are not wrong individually, but LLMs use them with mechanical frequency to create the appearance of logical flow. In human writing, transitions are varied and often implicit. A document where half the paragraph transitions use this list is AI-generated.

**Flag instruction:** Flag any document where 3+ of these words each appear more than twice. Flag any paragraph that opens with two consecutive paragraphs using this list.

---

### Rule 3.3 — Hedging Filler Phrases
**Flag any use of:**
- "It's important to note that..."
- "It's worth noting that..."
- "It cannot be overstated that..."
- "It should be noted that..."
- "One might argue that..."
- "As one might expect..."
- "Based on the information provided..."
- "From a broader perspective..."
- "Generally speaking..."
- "To some extent..."
- "There are several considerations..."
- "This raises important questions about..."

**Why it's a cliché:** These phrases are AI's hedging mechanism — they insert qualification without providing any actual qualification. They inflate word count and signal the writer's reluctance to take any firm position. "It's worth noting that" can almost always be deleted and replaced with simply stating the thing being noted.

**Flag instruction:** Flag every instance. Suggest direct replacement: delete the phrase and start the sentence with the content itself.

---

### Rule 3.4 — Forbidden Closing Phrases
**Flag any conclusion that opens with:**
- "In conclusion..."
- "In summary..."
- "In essence..."
- "To summarize..."
- "Ultimately..."
- "At the end of the day..."
- "Overall..."
- "All in all..."
- "To wrap up..."

**Why it's a cliché:** LLMs signal their conclusions the same way every time. Human writing finds more organic ways to end — often by returning to an earlier image, making a final claim, or simply stopping. Announced conclusions are an AI tell.

**Flag instruction:** Flag every announced conclusion. Suggest removing the signpost and restructuring the final paragraph to end on content, not on a summary announcement.

---

### Rule 3.5 — Importance Inflation Phrases
**Flag any use of:**
- "[X] plays a crucial/pivotal/vital role in..."
- "The importance of [X] cannot be overstated..."
- "Stands as a testament to..."
- "Represents a significant milestone in..."
- "Marks a pivotal moment in the evolution of..."
- "This underscores the need for..."
- "At its core, [X] is about..."
- "What makes this truly remarkable is..."

**Why it's a cliché:** LLMs remind the reader of a topic's importance repeatedly and apply importance language to mundane things. "A pivotal moment in the evolution of regional statistics" (an actual AI-generated phrase) is the canonical example. Every sentence cannot be a milestone or testament.

**Flag instruction:** Flag every instance. These phrases add no information — they only assert that the adjacent content is important. The adjacent content should demonstrate that itself.

---

## CATEGORY 4 — TONAL AND RHETORICAL PATTERNS

### Rule 4.1 — False Balance
**Pattern:** Every complex issue is presented as having two equally valid sides, wrapped with a tidy synthesis. No position is taken. All perspectives are honored. The conclusion acknowledges the complexity without resolving it.

**Why it's a cliché:** Human writers have opinions. They take sides, make bets, and argue positions. AI optimizes for inoffensiveness and produces writing where every argument is countered, every claim is qualified, and nothing is actually concluded. The result reads like a briefing document from a conflict-averse bureaucrat.

**Flag instruction:** Flag any sustained passage (200+ words) where no specific claim is made and every assertion is immediately balanced with its opposite. Flag any conclusion that lists "both sides" without endorsing one.

---

### Rule 4.2 — Emotional Beige / Tone Flatline
**Pattern:** Uniformly positive, upbeat, or neutral tone regardless of subject matter. No anger, no grief, no irony, no dark humor, no genuine unease. Every sad topic receives "this is both challenging and an opportunity for growth."

**Why it's a cliché:** LLMs trained on RLHF are optimized to avoid negative reactions, producing an emotional flatline. Human writing has registers — a writer gets frustrated, finds something ridiculous, is disturbed by something. AI produces the emotional equivalent of a corporate press release for every subject.

**Flag instruction:** Flag any passage where the emotional register feels incongruent with the subject matter (e.g., discussing trauma with the warmth of a wellness blog). Flag any use of "opportunity" or "growth" in response to described hardship unless earned.

---

### Rule 4.3 — Sycophantic Openers (in conversational or first-person prose)
**Pattern:** "You're not alone in feeling this way." / "The fact that you're asking this question shows remarkable self-awareness." / "What you're experiencing is both valid and understandable."

**Why it's a cliché:** AI-generated self-help, advice columns, and personal essays validate the reader reflexively before saying anything. Human writers earn validation by describing something specific and true.

**Flag instruction:** Flag any first-person or direct-address prose that opens with reader validation before making any substantive claim.

---

### Rule 4.4 — The Uplifting Conclusion Obligation
**Pattern:** Regardless of subject matter, conclusions circle back to hope, potential, growth, or a call to action. "The future holds great promise." "Together, we can..." "There has never been a more important time to..."

**Why it's a cliché:** AI appends uplifting conclusions because training rewards positive sentiment. Human writers — especially in fiction and serious non-fiction — often end on ambiguity, unresolved tension, or a darker note. The mandatory uplift is a tell.

**Flag instruction:** Flag any conclusion that introduces optimism, hope, or potential that was not substantively developed in the body of the piece.

---

## CATEGORY 5 — STRUCTURAL DOCUMENT-LEVEL PATTERNS

### Rule 5.1 — Uniform Paragraph Length
**Pattern:** All paragraphs are roughly the same length (typically 3–5 sentences, 60–100 words each). No very short paragraphs. No very long paragraphs. No single-sentence paragraphs except as deliberate stylistic devices.

**Why it's a cliché:** Human prose is rhythmically irregular. Writers break paragraphs at odd moments, write a two-sentence paragraph when the thought is short, write a twelve-sentence paragraph when they're building momentum. AI paragraphs are metronomically consistent.

**Flag instruction:** Measure paragraph lengths. If variance is low (all between 50–120 words with no outliers), flag the piece for rhythmic flatness.

---

### Rule 5.2 — Telegraphed Structure
**Pattern:** The introduction announces exactly what the piece will cover: "In this article, we will explore X, discuss Y, and examine Z." Sections have predictable headers: "Understanding X," "The Importance of Y," "The Future of Z," "Key Takeaways."

**Why it's a cliché:** AI structures content like a slide deck. Every argument is pre-announced, delivered, and then summarized. Human essays discover their arguments in the writing. The structure of a human piece often surprises even the writer.

**Flag instruction:** Flag any introduction that describes what the piece will do rather than doing it. Flag any section header that could apply to any piece about the same topic.

---

### Rule 5.3 — Copula Avoidance
**Pattern:** Substitution of "serves as," "marks the," "functions as," "acts as," or "features" for simpler "is" or "are."

**Example:** "The city serves as a hub for cultural exchange" instead of "The city is a hub for cultural exchange."

**Why it's a cliché:** LLMs avoid repetition of "is/are" via repetition-penalty mechanisms, substituting more elaborate constructions. This produces writing that feels artificially elevated without being more precise.

**Flag instruction:** Flag any "serves as," "marks the," or "functions as" where "is" would be more direct.

---

### Rule 5.4 — Excessive Em-Dash Usage
**Pattern:** Em-dashes used in place of commas, semicolons, colons, and parentheses throughout a piece. Multiple em-dashes per paragraph — often two or more in a single sentence — creating a distinctive staccato rhythm.

**Why it's a cliché:** GitHub analysis showed em-dash usage tripled in online content corresponding to ChatGPT adoption. LLMs default to em-dashes as universal connectors. In human writing, em-dashes are used sparingly for emphasis; AI deploys them structurally.

**Flag instruction:** Flag any piece with more than one em-dash per 100 words on average. Flag any sentence containing two or more em-dashes.

---

### Rule 5.5 — Elegant Variation (Synonym Cycling)
**Pattern:** A character, concept, or term is referred to by multiple synonyms within a short passage rather than repeating the same word. A character named John becomes "the protagonist," "the young man," "the traveler," "the figure," within two paragraphs.

**Why it's a cliché:** LLMs have repetition penalties that discourage using the same word twice in proximity, producing excessive synonym cycling. Human writers repeat names and terms naturally; they don't avoid repetition through synonym substitution but through genuine variation in focus.

**Flag instruction:** Flag any passage where a character or concept is referred to by three or more different terms within 200 words without a specific rhetorical purpose.

---

## CATEGORY 6 — FICTION-SPECIFIC PATTERNS

### Rule 6.1 — Palpable Tension
**Pattern:** "The tension was palpable." / "The atmosphere was heavy with unspoken words." / "A charged silence fell over the room."

**Flag instruction:** Flag every instance. These are the most overused atmospheric descriptors in AI fiction. They tell the reader how to feel rather than creating the sensation. Pangram Labs found "palpable" appears 95× more frequently in AI text.

---

### Rule 6.2 — The Suppressed Breath
**Pattern:** "She let out a breath she didn't know she was holding." / "[Character] exhaled slowly, releasing tension they hadn't realized had built."

**Flag instruction:** Flag every instance without exception. This phrase has become the single most iconic AI fiction tell.

---

### Rule 6.3 — Zone-Blocked Narrative
**Pattern:** Dialogue, exposition, and action appear in cleanly separated blocks rather than interleaved. A paragraph of pure dialogue, then a paragraph of pure description, then a paragraph of pure interiority, with no mixing.

**Why it's a cliché:** AI structures fiction like a screenplay format. Human fiction mixes these modes constantly — a character thinks mid-sentence, action interrupts dialogue, exposition is embedded in perception.

**Flag instruction:** Flag any scene where dialogue, action, and interiority appear in separate blocks of 3+ sentences each without mixing.

---

### Rule 6.4 — Emotion Telling Without Sensation
**Pattern:** Emotional states named directly without physical or behavioral specificity. "He felt devastated." / "She experienced a wave of profound grief." / "A deep sense of unease settled over him."

**Why it's a cliché:** AI names emotions; human writers render them through physical sensation, specific thought, or behavior. "Devastated" tells nothing. A specific physical response (hands moving wrong, inability to read a sentence twice, a sound coming out that wasn't planned) shows it.

**Flag instruction:** Flag any emotional state named as an abstraction without accompanying physical or behavioral specificity within the same sentence or adjacent sentence.

---

### Rule 6.5 — Stacked Metaphors for a Single Image
**Pattern:** Two or more distinct metaphors applied to the same thing within a single sentence or short passage. "A geometry of madness, a wound in the fabric of what is, older than law and time."

**Why it's a cliché:** AI attempts poetic density by stacking metaphor vehicles, but the metaphors don't reinforce each other — they compete. Human poetic writing usually commits to one vehicle and extends it.

**Flag instruction:** Flag any sentence containing more than one distinct metaphor vehicle for the same subject.

---

### Rule 6.6 — Hallmark Grief
**Pattern:** Grief, loss, or trauma scenes that read like inspirational content. A funeral that ends with a lesson learned. A breakdown followed by a resolution. Death processed cleanly into growth.

**Why it's a cliché:** AI optimizes for positive emotional closure. Human depictions of grief are messy, incomplete, and often unresolved. The emotional packaging of tragedy into a lesson is AI's most insidious fiction pattern because it makes emotionally serious material feel cheap.

**Flag instruction:** Flag any scene of loss or trauma that ends with a lesson, resolution, or forward-looking reframe.

---

## APPLYING THESE RULES: DETECTION PRIORITIES

When reviewing a text, work through these priorities in order:

**HIGH SEVERITY — Flag immediately and prominently:**
- Any item from Rule 1.1 (The Delve Family)
- Any item from Rule 3.1 (Forbidden Opening Phrases)
- Rule 6.2 (The Suppressed Breath)
- Rule 6.1 (Palpable Tension)
- Rule 4.4 (The Uplifting Conclusion Obligation)

**MEDIUM SEVERITY — Flag and group:**
- Inflation adjectives and adverbs (Rules 1.2, 1.3)
- Transitional and hedging phrases (Rules 3.2, 3.3, 3.4, 3.5)
- Structural sentence patterns (Rules 2.1–2.5)

**PATTERN SEVERITY — Flag as systemic:**
- Uniform paragraph length (Rule 5.1)
- Zone-blocked narrative (Rule 6.3)
- Emotion telling (Rule 6.4)
- Excessive em-dashes (Rule 5.4)
- Elegant variation (Rule 5.5)

**CONTEXT-DEPENDENT — Flag with caveat:**
- The metaphor cluster (Rule 1.4) — some metaphors may be earned; note which ones feel gratuitous
- False balance (Rule 4.1) — appropriate in genuinely analytical non-fiction; flag in creative prose
- The tricolon (Rule 2.2) — flag only when the pattern recurs mechanically, not single instances

---

## WHAT NOT TO FLAG

These are legitimate writing choices that superficially resemble clichés but should not be flagged:

- Single use of a flagged word in an otherwise clean piece (context dependent — note it, don't alarm)
- Genuine technical vocabulary that happens to appear in the red-flag list ("leverage" in finance writing, "navigate" in sailing writing)
- Tricolons where the three items are specific, non-interchangeable, and not rhythmically perfect
- Em-dashes used once or twice in a piece for genuine emphasis
- Short paragraphs that are short because the thought is short
- Announced conclusions in genuinely formal or academic writing where the convention is expected