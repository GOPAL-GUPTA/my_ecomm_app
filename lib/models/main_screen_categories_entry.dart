

class Entry  {
  final String id;
  final String title;
  final List<Entry> children;
  Entry(this.id, this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = [
  Entry('AC', 'Art & Craft', <Entry>[
    Entry('AC1', 'Crayons & Colour Pencil'),
    Entry('AC2', 'Colour paints'),
    Entry('AC3', 'Paint Brushes'),
    Entry('AC4', 'Sketch pen'),
    Entry('AC5', 'Oil Pastel'),
    Entry('AC6', 'Poster colours'),
    Entry('AC7', 'Wax Crayons'),
    Entry('AC8', 'Clay'),
  ]),
  Entry('N', 'Notebooks', <Entry>[
    Entry('N1', 'General Notebooks'),
    Entry('N2', 'Spiral Notebooks'),
    Entry('N3', 'Practical Noteebooks'),
    Entry('N4', 'A4 Size Notebooks'),
    Entry('N5', 'Drawings & Scrab Books'),
    Entry('N6', 'Graph Notebook')
  ]),
  Entry('P', 'Pencils', <Entry>[
    Entry('P1', 'Leads & Lead Pencil'),
  ]),
  Entry('Pn', 'Pens', <Entry>[
    Entry('Pn1', 'Ball Pens '),
    Entry('Pn2', 'Gel Pens'),
    Entry('Pn3', 'Click Pens'),
    Entry('Pn4', 'Liquid Ink Pens'),
    Entry('Pn5', 'Use & Throw Pens'),
    Entry('Pn6', 'Multi Coloured Pens'),
    Entry('Pn7', 'Pen Sets'),
    Entry('Pn8', 'Fountain Pens'),
    Entry('Pn9', 'Pen Refills'),
    Entry('Pn10', 'Correction Pen'),
  ]),
  Entry('HM', 'Highlighter & Marker', <Entry>[
    Entry('HM1', 'White Board Marker'),
    Entry('HM2', 'Permanent Marker'),
  ]),
  Entry('FF', 'Files & Folder', <Entry>[
    Entry('FF1', 'Cobra Files'),
    Entry('FF2', 'Button Bags'),
    Entry('FF3', 'CardBoard File'),
    Entry('FF4', 'Chain Bags'),
    Entry('FF5', 'Plastic Files'),
    Entry('FF6', 'Display Files'),
  ]),
  Entry('Ei', 'Engineering Instruments', <Entry>[
    Entry('Ei1', 'Scientific calculator'),
  ]),
];
